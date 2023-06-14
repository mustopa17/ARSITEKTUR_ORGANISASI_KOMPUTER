;~~~~~~~~~~~~~~~~~~~~~;
;PROGRAM : geserL.asm;
;FUNGSI :  geser kiri  ;
;========================================================S'to=;

.MODEL SMALL
.CODE
ORG 100h
Proses :
	
	MOV AX , 0FADH
	MOV CL, 3
	SHL AX, CL         ; GESER kekanan 3
	
	
INT 20H
END Proses