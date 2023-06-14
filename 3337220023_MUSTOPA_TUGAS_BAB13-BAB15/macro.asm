;~~~~~~~~~~~~~~~~~~~~~;
;PROGRAM : macroKAR.asm;
;FUNGSI :  PERINTAH CETAK KARAKTER ;
;========================================================S'to=;

CETAK_KAR MACRO KAR
	MOV CX,3
	MOV AH ,02
	MOV DL ,KAR
	ULANG:
	INT 21H
	LOOP ULANG
	ENDM
	
.MODEL SMALL
.CODE
ORG 100h
PROSES:
CETAK_KAR 'M'
INT 20H
END PROSES
		