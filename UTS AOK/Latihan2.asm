	.MODEL SMALL
	.CODE
	ORG 100h
Proses	:
	MOV AH, 09h
	MOV AL, 'A'
	MOV BH, 00h
	MOV BL, 93h
	MOV CX, 03h

	INT 10h
	INT 20h

END Proses