;~~~~~~~~~~~~~~~~~~~~~;
;PROGRAM : kalkulator.asm;
;FUNGSI : Aritmatika 2 ;
;========================================================S'to=;

.MODEL SMALL
.CODE
ORG 100h
start:
jmp Proses

		a dw 35
		b dw 12
		c dw 2
		d dw 5
	kal01 db 'bil A = $'
	kal02 db 13,10, 'bil B = $'
	kal03 db 13 ,10 , 'bil C= $'
	kal04 db 13 ,10, 'Hasil Penjumlahan A+B = $'
	kal05 db 13 ,10,'Hasil pengurangan B-C = $'
	kal06 db 13 ,10, 'Hasil Perkalian A*C = $ '
	
	Proses:
	mov ah,09
	mov dx , offset kal01
	int 21h
	mov ax , a
	jmp show
	bag1:
	mov ah,09
	mov dx , offset kal02
	int 21h
	mov ax , b
	jmp show
	bag2:
	mov ah,09
	mov dx , offset kal03
	int 21h
	mov ax , c
	jmp show
	bag3:
	mov ah,09
	mov dx , offset kal04
	int 21h
	mov ax , a
	Add ax , b
	
	jmp show
	
		bag4:
	mov ah,09
	mov dx , offset kal05
	int 21h
	mov ax , b
	sub ax , c
	
	jmp show
	
		bag5:
	mov ah,09
	mov dx , offset kal06
	int 21h
	mov ax , a
	mul ax , c
	
	jmp show
	
show: 
dec d
mov bx ,10
xor cx,cx
putar :
xor dx , dx
div bx
push dx
inc cx
cmp as, 0
jne putar
print:
pop dx
add dl, '0'
mov ah ,02
int 21h
loop print
cmp d,4
je bag1
cmp d,3
je bag2
cmp d,2
je bag3
cmp d,1
je bag4
cmp d,0
je bag5
int 20h
END start