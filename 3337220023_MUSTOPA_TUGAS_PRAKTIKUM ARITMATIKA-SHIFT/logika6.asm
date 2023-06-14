;~~~~~~~~~~~~~~~~~~~~~;
;PROGRAM : LOGIKA.ASM;
;FUNGSI :  GERBANG xor ;
;========================================================S'to=;

.MODEL SMALL
.CODE
ORG 100h
Proses :
	
	MOV AL , 3FH
	MOV BL, 1AH
	xor AL , BL
	
	
INT 20H
END Proses