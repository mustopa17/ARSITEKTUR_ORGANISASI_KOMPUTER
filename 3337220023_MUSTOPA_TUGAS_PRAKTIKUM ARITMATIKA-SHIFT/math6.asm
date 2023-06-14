;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
;PROGRAM : math6.asm;
;FUNGSI : OPERASI ARITMATIKA SUB (PENGURANGAN DENGAN DEBUG ;
;========================================================S'to=;

.MODEL SMALL
.CODE
ORG 100h
Proses :
	MOV AX , 15H
	MOV BX , 12H  
	SUB AX , BX		
	SBB AX , AX 	
	
	INT 20H
END Proses