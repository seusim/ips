;--- assemble: JWasm -bin -Fo a.com a.asm
dummy	equ 063h,063h,063h,063h,063h ;blocco di riempimento 
;dummy	equ 090h,090h,090h,090h,090h ;blocco di riempimento 
vuoto	equ 450 ;spazio tra le macro
vuotoin	equ 45 ;spazio tra le trappole

	.model tiny
	.data
crlf	equ 13,10
str0_dummy	db vuoto dup (dummy)
str_inizio	db crlf,"Inizio Test",'$'
str_fine	db crlf,"OK",'$'
str_errore	db crlf,"ERRORE",crlf,'$'

	.code
	org 100h
start:
	MOV AH,00H 		;funzione Pulisci lo schermo
	MOV AL,03H  
	INT 10H
	nop
	mov di, 0h 		;funzione PRINT [dx]
	mov ah, 09h
	mov dx, offset str_inizio
	int 21h
	nop 
	
;blocco trappola:
;stampa il numero del blocco

salta	macro bkm
local	ok1,ok2,ok3,ok4,ok5,ok6,ok7,ok8,ok9,ok10,loop_bkn
local	dummy1,dummy2,dummy3,dummy4,dummy5,dummy6,dummy7,dummy8,dummy9
	mov di, 0h		;visualizza "blocco n"
	mov ah, 09h
	mov dx, offset ok10
	int 21h
	mov ah, 020h
loop_bkn:
	mov byte ptr ips_start+2,ah
	mov al,[bkm]
	jmp ok8
dummy1	db vuotoin dup (dummy)	;riempimento codice illegale dopo il JMP
	jmp errore
ok1:	mov bl,[bkm]
	call delay1
	call progress
	jmp ok9
dummy2	db vuotoin dup (dummy)	;riempimento codice 
	jmp errore
ok2:	mov cl,[bkm]
	call delay1
	call progress
	jmp ok1
dummy3	db vuotoin dup (dummy)	;riempimento codice  
	jmp errore
ok3:	mov dl,[bkm]
	call delay1
	call progress
	jmp ok2
dummy4	db vuotoin dup (dummy)	;riempimento codice  
	jmp errore
ok4:	mov ah,[bkm]
	call delay1
	call progress
	jmp ok3
dummy5	db vuotoin dup (dummy)	;riempimento codice  
	jmp errore
ok5:	mov bh,[bkm]
	call delay1
	call progress
	jmp ok4
dummy6	db vuotoin dup (dummy)	;riempimento codice  
	jmp errore
ok6:	mov ch,[bkm]
	call delay1
	call progress
	jmp ok5
dummy7	db vuotoin dup (dummy)	;riempimento codice  
	jmp errore
ok7:	mov dh,[bkm]
	call delay1
	call progress
	jmp ok6
dummy8	db vuotoin dup (dummy)	;riempimento codice  
	jmp errore
ok8:	mov bl,[bkm]
	call delay1
	call progress
	jmp ok7
dummy9	db vuotoin dup (dummy)	;riempimento codice  
	jmp errore
ok10	db crlf,"===== BLOCCO ",030h+bkm," =====",crlf,"$"
ok9:	mov ah,[ips_start+2]
	dec ah
	jne loop_bkn
	nop
	
endm

	jmp saltoN4
saltoN1:
salta 1
	jmp fine
testx:
str2_dummy	db vuoto dup (dummy)
saltoN2:	
salta 2
	jmp saltoN1
str3_dummy	db vuoto dup (dummy)
saltoN3:
salta 3
	jmp saltoN2
str4_dummy	db vuoto dup (dummy)
saltoN4:
salta 4
	jmp saltoN3
str5_dummy	db vuoto dup (dummy)
fine:
	mov dx, offset str_fine
	jmp ptexit
	nop
	nop
dummy1	db vuotoin dup (dummy)	;riempimento codice  

errore:
	mov dx, offset str_errore
ptexit:	mov cx, 0
	mov bx, 0
	mov ah, 09h
	
	int 21h
	mov ax, 4c00h		;termina il programma
	int 21h		
	nop
delay1:
	mov bx, 001h
loop_b:
	mov cx, 0F0h
loop_c:	
	dec cx 
	jnz loop_c
	dec bx
	jnz loop_b
	ret
progress:
	mov di, word ptr [ips_start]
	mov al,[di+ips_start]
	mov dl,al
	mov ah,02h
	int 21h
	inc di
	mov word ptr ips_start,di
	ret
ips_start	db 3,0,0
include <ips858.inc>
ips_end	db 20h
str6_dummy	db vuoto dup (dummy)	;riempimento codice  
str7_dummy	db vuoto dup (dummy) 	;riempimento codice  
str8_dummy	db vuoto dup (dummy)	;riempimento codice  

	end start	