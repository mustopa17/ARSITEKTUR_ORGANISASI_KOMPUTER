.MODEL SMALL
.STACK 100H

.DATA

    LAYAR DB 4000 DUP (?)
    MENU DB 9, 9, '+============================= +', 13, 10
         DB 9, 9, '|      >> >> Menu Sorot << <<      |', 13, 10
         DB 9, 9, '+================================== +', 13, 10
         DB 9, 9, '|                                 |', 13, 10
         DB 9, 9, '| 1. Cetak Karakter               |', 13, 10
         DB 9, 9, '| 2. Karakter Berwarna            |', 13, 10
         DB 9, 9, '| 3. Program Rontok               |', 13, 10
         DB 9, 9, '| 4. Keluar                       |', 13, 10
         DB 9, 9, '|                                 |', 13, 10
         DB 9, 9, '+==================================+$'

    POSX DB 22
    POSY DB 12
    PANAH_ATAS EQU 72
    PANAH_BAWAH EQU 80
    TENTER EQU 0DH

    KAL DB 'Melayang-layang $'
    KAL2 DB 'Tekan Enter Untuk Kembali ke Menu $'

.CODE

    ORG 100H

    START:

        MOV AX, @DATA
        MOV DS, AX

        CALL CLEAR_SCREEN
        CALL DISPLAY_MENU

    LOOP_MENU:
        CALL READ_KEY
        CMP AH, PANAH_BAWAH
        JE MOVE_DOWN
        CMP AH, PANAH_ATAS
        JE MOVE_UP
        CMP AL, TENTER
        JNE LOOP_MENU
        JMP PROCESS_OPTION

    MOVE_UP:
        CMP POSY, 12
        JE LAST_OPTION
        DEC POSY
        JMP LOOP_MENU

    MOVE_DOWN:
        CMP POSY, 15
        JE FIRST_OPTION
        INC POSY
        JMP LOOP_MENU

    LAST_OPTION:
        MOV POSY, 15
        JMP LOOP_MENU

    FIRST_OPTION:
        MOV POSY, 12
        JMP LOOP_MENU

    PROCESS_OPTION:
        CMP POSY, 12
        JE PRINT_CHARACTERS
        CMP POSY, 13
        JE PRINT_COLORED_CHARACTERS
        CMP POSY, 14
        JE RUN_PROGRAM
        CMP POSY, 15
        JE EXIT_PROGRAM

    PRINT_CHARACTERS:
        CALL CLEAR_SCREEN
        CALL PRINT_ALPHABET
        JMP LOOP_MENU

    PRINT_COLORED_CHARACTERS:
        CALL CLEAR_SCREEN
        CALL PRINT_COLORED_ALPHABET
        JMP LOOP_MENU

    RUN_PROGRAM:
        CALL CLEAR_SCREEN
        CALL RUN_ROTOR_PROGRAM
        JMP LOOP_MENU

    EXIT_PROGRAM:
        MOV AH, 4CH
        INT 21H

    CLEAR_SCREEN:
        MOV AH, 06H
        MOV AL, 0
        XOR CX, CX
        MOV DX, 184FH
        MOV BH, 07H
        INT 10H
        RET

    DISPLAY_MENU:
        MOV AH, 02H
        MOV DL, 0
        MOV DH, 8
        INT 10H

        LEA DX, MENU
        MOV AH, 09H
        INT 21H
        RET

    READ_KEY:
        MOV AH, 00H
        INT 16H
        RET

    PRINT_ALPHABET:
        MOV AH, 02H
        MOV DL, 'A'
        MOV CX, 26

    PRINT_LOOP:
        INT 21H
        INC DL
        LOOP PRINT_LOOP
        CALL READ_KEY
        RET

    PRINT_COLORED_ALPHABET:
        MOV AH, 09H
        MOV BX, 29H
        MOV AL, 'Z'
        MOV CX, 26

    PRINT_COLORED_LOOP:
        INT 10H
        DEC AL
        INC BL
        LOOP PRINT_COLORED_LOOP
        CALL READ_KEY
        RET

    RUN_ROTOR_PROGRAM:
        MOV AH, 09H
        LEA DX, KAL
        INT 21H

        MOV AX, 0B800H
        MOV ES, AX
        MOV BX, 3998
        MOV CX, 25

    ROTOR_LOOP_Y:
        MOV POSY, 12
        PUSH CX
        MOV CX, 80

    ROTOR_LOOP_X:
        CMP BYTE PTR ES:[BX], 33H
        JB SKIP_GESER
        CALL GESER_POSY

    SKIP_GESER:
        SUB BX, 2
        LOOP ROTOR_LOOP_X

        POP CX
        LOOP ROTOR_LOOP_Y

        MOV AH, 09H
        LEA DX, KAL2
        INT 21H

        CALL READ_KEY
        RET

    GESER_POSY:
        INC BX
        PUSH AX

    GESER_LOOP:
        PUSH BX
        MOV AL, BYTE PTR ES:[BX]
        MOV BYTE PTR ES:[BX-160], AL
        MOV AH, 02H

    HILANG_LOOP:
        MUL AH
        MOV BYTE PTR ES:[BX], ' '
        ADD BX, AX
        CALL DELAY
        INC BX
        SUB BX, 160
        MOV CX, 20
        LOOP HILANG_LOOP

        POP BX
        MOV BYTE PTR ES:[BX], 6FH
        POP AX
        ADD BX, 2
        LOOP GESER_LOOP

        RET

    DELAY:
        PUSH CX
        LOCAL LOOP_DELAY

        MOV CX, 1000
        ULANGDELAY:
        NOP
        LOOP ULANGDELAY

        POP CX
        RET

    END START
