;~~~~~~~~~~~~~~~~~~~~~;
;PROGRAM : pop1.asm;
;FUNGSI :  PROGRAM SEDERHANA POP  ;
;========================================================S'to=;

.MODEL SMALL
.CODE
ORG 100h
MULAI:
	MOV DX, 'S'
	PUSH DX
	MOV DX , 'E'
	PUSH DX
	MOV AH , 02H
	
	MOV DL , 'Y'
	INT 21H
	POP DX
	INT 21H
	POP DX
	INT 21H
	
	
	
INT 20H
END MULAI