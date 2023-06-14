;~~~~~~~~~~~~~~~~~~~~~;
;PROGRAM : proc1,asm;
;FUNGSI :  PERINTAH CALL;
;========================================================S'to=;

.MODEL SMALL
.CODE
ORG 100h

TDATA :
		JMP PROSES
		KAR DB ?
		KLM DB 'UNIVERSITAS PROF . DR MUSTOPA '
	PROSES:
		MOV CX, 30
		XOR BX , BX
	
	ULANG:
		MOV DL ,KLM [BX]
		MOV KAR , DL
		CALL CETAK_KAR
		INC BX
		LOOP ULANG
		INT 20H
	
	CETAK_KAR PROC NEAR
		PUSH AX
		PUSH DX
		MOV AH,02H
		MOV DL ,KAR
		INT 21H
		POP DX
		POP AX
		RET
	CETAK_KAR ENDP
		
	
	
END TDATA