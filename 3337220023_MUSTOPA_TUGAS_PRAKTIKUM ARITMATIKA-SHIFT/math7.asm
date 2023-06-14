;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
;PROGRAM : math7.asm;
;FUNGSI : OPERASI ARITMATIKA SUB (PENGURANGAN DENGAN DEBUG ;
;========================================================S'to=;

.MODEL SMALL
.CODE
ORG 100h
Proses :
	MOV AX , 24H
	MOV BX , 5H  
	SUB AX , BX		
	SUB AX , AX 	
	
	INT 20H
END Proses