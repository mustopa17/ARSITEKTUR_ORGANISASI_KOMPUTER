.MODEL SMALL
.CODE
ORG 100h
Proses	:
	MOV AH, 02h
	MOV DL, 'A'
	MOV CX, 10h
Ulang	:
	INT 21h
	INC DL
	LOOP Ulang

	INT 20h
END	Proses