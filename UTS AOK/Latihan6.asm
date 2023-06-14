	.MODEL SMALL
	.CODE
	ORG 100h
Proses	:
	mov AH,09h
	mov BL,93h
	mov CX,6h
Ulang	:
	int 10h
	ADD BL,1

	loop Ulang
mov AH,02h
mov DL,41h
INT 21h
mov DL,49h
INT 21h
mov DL,53h
INT 21h
mov DL,59h
INT 21h
mov DL,41h
INT 21h
mov DL,48h
int 21h
int 20h
END Proses
