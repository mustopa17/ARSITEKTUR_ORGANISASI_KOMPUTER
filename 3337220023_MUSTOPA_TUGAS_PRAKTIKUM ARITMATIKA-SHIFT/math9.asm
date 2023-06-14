;~~~~~~~~~~~~~~~~~~~~~;
;PROGRAM : math9.asm;
;FUNGSI :  ARITMATIKA PERINTAH DEC ;
;========================================================S'to=;

.MODEL SMALL
.CODE
ORG 100h
Proses :
	MOV DL , 20H
	DEC DL
	
	
	INT 20H
END Proses