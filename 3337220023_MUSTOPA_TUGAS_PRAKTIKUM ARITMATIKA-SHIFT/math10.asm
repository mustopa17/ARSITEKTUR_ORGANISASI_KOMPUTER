;~~~~~~~~~~~~~~~~~~~~~;
;PROGRAM : math10.asm;
;FUNGSI :  MELAKUKAN PERKALIAN DENGAN DEBUG ;
;========================================================S'to=;

.MODEL SMALL
.CODE
ORG 100h
Mdata :
	JMP Proses  ;lompat ke pross
	A DW 01EFh
	B DW 02EFh
	Hsloo DW ?
	HslHi DW ?
	
Proses:
	MOV AX , A
	MUL B
	MOV Hsloo, AX
	MOV HslHi , DX
	
	INT 20H
END Mdata