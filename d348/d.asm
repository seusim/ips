;--- assemble: JWasm -bin -Fo D8.com D8.asm
;dummy	equ 0f0h,00fh,0c7h,0c8h,090h ;blocco di riempimento (illegal code)
dummy	equ 090h,090h,090h,090h,090h ;blocco di riempimento 
vuoto	equ 450 ;spazio tra le macro
vuotoin	equ 45 ;spazio tra le trappole

	.model tiny
	.data
crlf	equ 13,10
str0_dummy	db vuoto dup (dummy)
str_inizio	db crlf,"Inizio Test",'$'
str_fine	db crlf,"OK",'$'
str_errore	db crlf,"Errore Intercettato",crlf,'$'
str_regolare	db crlf,"Terminato Regolarmente",crlf,'$' 
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
local	ok1,ok2,ok3,ok4,ok5,ok6,ok7,ok8,ok9,ok10,loop_bkn,esce_bkn,segue
local	ok1_p,ok2_p,ok3_p,ok4_p,ok5_p,ok6_p,ok7_p,ok8_p,ok9_p,ok10_p,loop_bkn_p,esce_bkn_p,segue_p
local	dummy1,dummy2,dummy3,dummy4,dummy5,dummy6,dummy7,dummy8,dummy9
	mov di, 0h		;visualizza "blocco n"
	mov ah, 09h
	mov dx, offset ok10
	int 21h
	mov ah, 020h
	;
	mov di,cs:loop_bkn_p
loop_bkn_p:	mov si,cs:loop_bkn_p 	; inizio loop_bkn_protetto
	cmp di,si 	   	;
	je loop_bkn	   	; se non conferma key... 
	jmp errore	   	; gestione errore	

loop_bkn:
	mov ch,ah		; controllo range puntatore 0..20h
	sub ch,021h
	jnc errore		; errore out of range
	mov di,cs:segue_p
	jc segue_p		; prosegue
	jmp errore		; intercetta errore jc+jnc <> true
segue_p: 	mov si,cs:segue_p 	; inizio segue_protetto
	cmp di,si 	   	;
	je segue	   	; se non conferma key... 
	jmp errore	   	; gestione errore
segue:
	mov byte ptr ips_start+2,ah
	mov al,[bkm]
	mov di,cs:ok8_p	;imposta chiave per salto
	jmp ok8_p
dummy1	db vuotoin dup (dummy)	;riempimento codice illegale dopo il JMP
	jmp errore

ok1_p:	mov si,cs:ok1_p 	; inizio ok1_protetto
	cmp di,si 	   	;
	je ok1	   	; se non conferma key... 
	jmp errore	   	; gestione errore

ok1:	mov bl,[bkm]
	mov di,cs:delay1_p	;imposta chiave per salto
	call delay1_p
	mov di,cs:progress_p	;imposta chiave per salto
	call progress_p
	mov di,cs:ok9_p	;imposta chiave per salto
	jmp ok9_p
dummy2	db vuotoin dup (dummy)	;riempimento codice illegale dopo il JMP
	jmp errore

ok2_p:	mov si,cs:ok2_p 	; inizio ok2_protetto
	cmp di,si 	   	;
	je ok2	   	; se non conferma key... 
	jmp errore	   	; gestione errore

ok2:	mov cl,[bkm]
	mov di,cs:delay1_p	;imposta chiave per salto
	call delay1_p
	mov di,cs:progress_p	;imposta chiave per salto
	call progress_p
	mov di,cs:ok1_p	;imposta chiave per salto
	jmp ok1_p
dummy3	db vuotoin dup (dummy)	;riempimento codice illegale dopo il JMP
	jmp errore
	
ok3_p:	mov si,cs:ok3_p 	; inizio ok3_protetto
	cmp di,si 	   	;
	je ok3	   	; se non conferma key... 
	jmp errore	   	; gestione errore
	
ok3:	mov dl,[bkm]
	mov di,cs:delay1_p	;imposta chiave per salto
	call delay1_p
	mov di,cs:progress_p	;imposta chiave per salto
	call progress_p
	mov di,cs:ok2_p	;imposta chiave per salto
	jmp ok2_p
dummy4	db vuotoin dup (dummy)	;riempimento codice illegale dopo il JMP
	jmp errore
	
ok4_p:	mov si,cs:ok4_p 	; inizio ok4_protetto
	cmp di,si 	   	;
	je ok4	   	; se non conferma key... 
	jmp errore	   	; gestione errore
	
ok4:	mov ah,[bkm]
	mov di,cs:delay1_p	;imposta chiave per salto
	call delay1_p
	mov di,cs:progress_p	;imposta chiave per salto
	call progress_p
	mov di,cs:ok3_p	;imposta chiave per salto
	jmp ok3_p
dummy5	db vuotoin dup (dummy)	;riempimento codice illegale dopo il JMP
	jmp errore
	
ok5_p:	mov si,cs:ok5_p 	; inizio ok5_protetto
	cmp di,si 	   	;
	je ok5	   	; se non conferma key... 
	jmp errore	   	; gestione errore
	
ok5:	mov bh,[bkm]
	mov di,cs:delay1_p	;imposta chiave per salto
	call delay1_p
	mov di,cs:progress_p	;imposta chiave per salto
	call progress_p
	mov di,cs:ok4_p	;imposta chiave per salto
	jmp ok4_p
dummy6	db vuotoin dup (dummy)	;riempimento codice illegale dopo il JMP
	jmp errore

ok6_p:	mov si,cs:ok6_p 	; inizio ok6_protetto
	cmp di,si 	   	;
	je ok6	   	; se non conferma key... 
	jmp errore	   	; gestione errore
	
ok6:	mov ch,[bkm]
	mov di,cs:delay1_p	;imposta chiave per salto
	call delay1_p
	mov di,cs:progress_p	;imposta chiave per salto
	call progress_p
	mov di,cs:ok5_p	;imposta chiave per salto
	jmp ok5_p
dummy7	db vuotoin dup (dummy)	;riempimento codice illegale dopo il JMP
	jmp errore

ok7_p:	mov si,cs:ok7_p 	; inizio ok7_protetto
	cmp di,si 	   	;
	je ok7	   	; se non conferma key... 
	jmp errore	   	; gestione errore

ok7:	mov dh,[bkm]
	mov di,cs:delay1_p	;imposta chiave per salto
	call delay1_p
	mov di,cs:progress_p	;imposta chiave per salto
	call progress_p
	mov di,cs:ok6_p	;imposta chiave per salto
	jmp ok6_p
dummy8	db vuotoin dup (dummy)	;riempimento codice illegale dopo il JMP
	jmp errore
	
ok8_p:	mov si,cs:ok8_p 	; inizio ok8_protetto
	cmp di,si 	   	;
	je ok8	   	; se non conferma key... 
	jmp errore	   	; gestione errore
	
ok8:	mov bl,[bkm]
	mov di,cs:delay1_p	;imposta chiave per salto
	call delay1_p
	mov di,cs:progress_p	;imposta chiave per salto
	call progress_p
	mov di,cs:ok7_p	;imposta chiave per salto
	jmp ok7_p
dummy9	db vuotoin dup (dummy)	;riempimento codice illegale dopo il JMP
	jmp errore
ok10	db crlf,"===== BLOCCO ",030h+bkm," =====",crlf,"$"

ok9_p:	mov si,cs:ok9_p 	; inizio ok9_protetto
	cmp di,si 	   	;
	je ok9	   	; se non conferma key... 
	jmp errore	   	; gestione errore
	
ok9:	mov ah,[ips_start+2]
	mov di,cs:loop_bkn_p	; imposta chiave per salto loop_bkn_p
	dec ah
	jne loop_bkn_p		; ripetizione
	mov di,cs:esce_bkn_p	; imposta chiave per salto esce_bkn_p
	je esce_bkn_p		; exit con procedura esce_bkn_p
	jmp errore		; intercetta je+jne <> true
	
esce_bkn_p:	mov si,cs:esce_bkn_p 	; inizio esce_bkn_protetto
	cmp di,si 	   	;
	je esce_bkn	   	; se non conferma key... 
	jmp errore	   	; gestione errore	
esce_bkn:
	nop
	
endm

	mov di,cs:saltoN4_p	; imposta chiave per salto saltoN4_p
	jmp saltoN4_p
	
saltoN1_p:	mov si,cs:saltoN1_p 	; inizio saltoN1_protetto
	cmp di,si 	   	;
	je saltoN1	   	; se non conferma key... 
	jmp errore	   	; gestione errore
saltoN1:
salta 1
	mov di,cs:fine_p	;imposta chiave per salto fine_p
	jmp fine_p
testx:
str2_dummy	db vuoto dup (dummy)

saltoN2_p:	mov si,cs:saltoN2_p 	; inizio saltoN2_protetto
	cmp di,si 	   	;
	je saltoN2	   	; se non conferma key... 
	jmp errore	   	; gestione errore
	
saltoN2:	
salta 2
	mov di,cs:saltoN1_p	; imposta chiave per salto saltoN1_p
	jmp saltoN1_p
str3_dummy	db vuoto dup (dummy)

saltoN3_p:	mov si,cs:saltoN3_p 	; inizio saltoN3_protetto
	cmp di,si 	   	;
	je saltoN3	   	; se non conferma key... 
	jmp errore	   	; gestione errore
saltoN3:
salta 3	 
	mov di,cs:saltoN2_p	;imposta chiave per salto saltoN4_p
	jmp saltoN2_p
str4_dummy	db vuoto dup (dummy)

saltoN4_p:	mov si,cs:saltoN4_p 	; inizio saltoN4_protetto
	cmp di,si 	   	;
	je saltoN4	   	; se non conferma key... 
	jmp errore	   	; gestione errore
saltoN4:	
salta 4
	mov di,cs:saltoN3_p	;imposta chiave per salto saltoN3_p
	jmp saltoN3_p
str5_dummy	db vuoto dup (dummy)

fine_p:	mov si,cs:fine_p 	; inizio fine_protetto
	cmp di,si 	   	;
	je fine	   	; se non conferma key... 
	jmp errore	   	; gestione errore
fine:
	mov dx, offset str_regolare
	mov di,cs:ptexit_p	;imposta chiave per salto ptexit_p
	jmp ptexit_p
	nop
	nop
	mov di,cs:ptexit_p	;imposta chiave per salto ptexit_p
	jmp ptexit_p
dummy1	db vuotoin dup (dummy)	;riempimento codice illegale dopo il JMP

errore:
	mov dx, offset str_errore
 	mov cx, 0
	mov bx, 0
	mov ah, 09h
	int 21h
	mov ax, 4c00h	;termina il programma
	int 21h		
	nop	

ptexit_p:	mov si,cs:ptexit_p 	; inizio ptexit_protetto
	cmp di,si 	   	;
	je ptexit	   	; se non conferma key... 
	jmp errore	   	; gestione errore
	
ptexit:	mov cx, 0
	mov bx, 0
	mov ah, 09h
	
	int 21h
	mov ax, 4c00h		;termina il programma
	int 21h		
	nop
	
delay1_p:	mov si,cs:delay1_p 	; inizio delay1_protetto
	cmp di,si 	   	;
	je delay1	   	;
	jmp errore	   	; gestione errore
delay1:
	mov bx, 08		; -=-=-=-=- ORIGINALE -=-=-=-=-
	
	mov di,cs:loop_b_p 	; chiave per loop_b_protetto
loop_b_p:	mov si,cs:loop_b_p 	; inizio loop_b_protetto
	cmp di,si 	   	;
	je loop_b	   	;
	jmp errore	   	; gestione errore
loop_b:
	mov cx, 010		; -=-=-=-=- ORIGINALE -=-=-=-=-
	
	mov di,cs:loop_c_p 	; chiave per loop_c_protetto
loop_c_p:	mov si,cs:loop_c_p 	; inizio loop_c_protetto
	cmp di,si 	   	;
	je loop_c	   	;
	jmp errore	   	; gestione errore
loop_c:	
	mov ax,cx		;controllo range indice cx 
	sub ax,011		;0..10
	mov di,cs:loop_c_dec_p	; chiave per loop_c_dec_p
	jc loop_c_dec_p	;se rientra prosegue
	jnc errore		;se è fuori errore
	jmp errore		;intercetta errore jc+jnc <> true
loop_c_dec_p:	mov si,cs:loop_c_dec_p 	; inizio loop_c_dec_p
	cmp di,si 	   	;
	je loop_c_dec	   	;
	jmp errore	   	; gestione errore
loop_c_dec:	dec cx 		; -=-=-=-=- ORIGINALE -=-=-=-=-
	mov di,cs:loop_c_p	;imposta chiave per salto loop_c_protetto
	jnz loop_c_p		; -=-=-=-=- ORIGINALE -=-=-=-=-
	mov di,cs:loop_b_dec_p	;imposta chiave per salto loop_b_dec_p
	jz loop_b_dec_p	
	jmp errore		;intercetta errore jz+jnz <> true
	
	;mov di,cs:loop_b_dec_p 	; chiave per loop_b_protetto
loop_b_dec_p:	mov si,cs:loop_b_dec_p 	; inizio loop_c_protetto
	cmp di,si 	   	;
	je loop_b_dec	   	;key confermata prosegue
	jmp errore	   	; gestione errore
loop_b_dec:
	mov ax,bx		;controllo range indice bx 
	sub ax,09		;0..8
	mov di,cs:loop_b_dec_cn	; chiave per loop_b_dec_cn
	jc loop_b_dec_cn	;se rientra prosegue
	jnc errore		;se è fuori è comunque errore non c'e' bisogno di conferma key
	jmp errore		;intercetta errore jc+jnc <> true
loop_b_dec_cn:	mov si,cs:loop_b_dec_cn 	; inizio loop_b_dec_cn
	cmp di,si 	   	;
	je loop_b_cnf 	   	;key confermata prosegue
	jmp errore	   	; gestione errore
loop_b_cnf:	dec bx		; -=-=-=-=- ORIGINALE -=-=-=-=-
	mov di,cs:loop_b_p	;imposta chiave per salto loop_b_protetto
	jnz loop_b_p
	mov di,cs:loop_b_exit	;imposta chiave per prosecuzione (con salto)
	jz loop_b_exit		;
	jmp errore		;intercetta errore jz+jnz <> true
loop_b_exit:	ret
	
progress_p:	mov si,cs:progress_p 	; inizio progress_protetto
	cmp di,si 	   	;
	je progress	   	; key confermata prosegue
	jmp errore	   	; gestione errore 
progress:
;stampa a video un carattere de IPS e riposizione il cursore
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
str6_dummy	db vuoto dup (dummy)
str7_dummy	db vuoto dup (dummy)
str8_dummy	db vuoto dup (dummy)

	end start	