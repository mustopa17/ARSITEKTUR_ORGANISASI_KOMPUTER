	.MODEL SMALL
	.CODE
	ORG 100h
Proses	:
	MOV AH, 02h
	MOV DL, 'A'
	MOV CX, 26
Ulang	:
	INT 21h
	ADD DL,1
LOOP Ulang
	INT 20h
END Proses