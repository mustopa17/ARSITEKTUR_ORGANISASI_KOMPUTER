;~~~~~~~~~~~~~~~~~~~~~;
;PROGRAM : LOGIKA.ASM;
;FUNGSI :  GERBANG AND ;
;========================================================S'to=;

.MODEL SMALL
.CODE
ORG 100h
Proses :
	
	MOV AL , 3FH
	MOV BL, 1AH
	AND AL , BL
	
INT 20H
END Proses