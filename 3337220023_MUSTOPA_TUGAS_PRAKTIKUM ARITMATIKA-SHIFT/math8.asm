;~~~~~~~~~~~~~~~~~~~~~;
;PROGRAM : math8.asm;
;FUNGSI : OPERASI ARITMATIKA SUB DAN SBB ;
;========================================================S'to=;

.MODEL SMALL
.CODE
ORG 100h
Proses :
	MOV AL , 10H
	MOV BL , 20H
	MOV DL , 30H
	SUB AL , BL		
	SBB BL , DL 	
	
	INT 20H
END Proses