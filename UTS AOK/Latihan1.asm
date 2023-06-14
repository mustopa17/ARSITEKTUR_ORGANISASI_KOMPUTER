	.MODEL SMALL
	.CODE
	ORG 100h
Proses	:
	MOV AH, 02h
	MOV DL, 'A'

	INT 21h
	INT 20h

END Proses