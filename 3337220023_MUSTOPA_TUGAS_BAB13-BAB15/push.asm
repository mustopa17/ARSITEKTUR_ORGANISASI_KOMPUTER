;~~~~~~~~~~~~~~~~~~~~~;
;PROGRAM : push.asm;
;FUNGSI :  INPUT 1 KARAKTER DARI KEYBOARD ;
;========================================================S'to=;

.MODEL SMALL
.CODE
ORG 100h

TDATA :
		JMP PROSES 
		T_ASCII DB 13,10 ,'INI ADALAH TOMBOL ASCII : $ '
		T_EXTENDED DB 13 ,10, 'INI ADALAH 	TOMBOL  EXTENDED : $ '
	PROSES:
		MOV AH ,0
		INT 16H
		PUSH AX
		CMP AL,00
		JE EXTENDED
	ASCII:
		LEA DX , T_ASCII
		MOV AH ,09
		INT 21H
		POP AX
		MOV DL, AL
		MOV AH, 2
		INT 21H
		CMP AL , 'Q'
		JE EXIT
		CMP AL , 'q'
		JE EXIT
		JMP PROSES
	EXTENDED :
		LEA DX, T_EXTENDED
		MOV AH, 09
		INT 21H
		JMP PROSES
	EXIT :
	INT 20H
	
END TDATA