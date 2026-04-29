	
	AREA mycode, CODE, READONLY
    EXPORT access_hash
		
access_hash PROC
	PUSH {R4-R7,LR}
	
	MOVS R2, #0 	; R2 = Hash. Initialize to zero
	MOV R3, R0		; R3 = String pointer
	
len_loop			; Loop to figure length of string
	LDRB R1, [R3] 	; Load byte (character) into R1 from string
	CMP R1, #0		; Check if it is the Null terminator \0
	BEQ len_done	; If zero string ended, exit loop
	ADDS R3, R3, #1 ; Else increment string pointer by 1 byte
	ADDS R2, R2, #1 ; Increment hash (length)
	B len_loop		; Repeat loop
	
len_done
	MOVS R3, R0		; Reset pointer back to start of string for processing
	MOVS R4, #0xDF  ; Load mask (11011111) for lowercase to uppercase conversion
	
	; -- Process characters --
;process_loop
;	LDRB R1, [R3]	; Load character
;	CMP R1, #0		; check if it is the end of string
;	BEQ end_process	; if it is exit the loop
;	ADDS R3, R3, #1	; Increment string pointer for next iteration
	
	; uppercase
kefalaio_loop
	LDRB R1, [R3]
	CMP R1, #0
	BEQ kefalaio_done
	CMP R1, #'A'
	BLT mikro_el
	CMP R1, #'Z'
	BLE megalo_el
	
	; lowercase
mikro_el
	CMP R1, #'a'
	BLT arithmos_el
	CMP R1, #'z'
	BLE pezo_el
	
	; number
arithmos_el
	CMP R1, #'0'
	BLT next_char
	CMP R1, #'9'
	BGT next_char
	
	SUB R7, R1, #'0'
	LDR R5, =digit_table
	LDRB R6, [R5,R7]
	ADD R2, R2, R6
	B next_char
	
megalo_el
	LSL R7, R1, #1
	ADD R2, R2, R7
	B next_char
	
pezo_el
	AND R1, R4
	ADD R2, R2, R1
	B next_char
	
next_char
	ADDS R3, R3, #1
	B kefalaio_loop
	
kefalaio_done
	MOV R0, R2
	
	POP {R4-R7,PC}

	ENDP
		
digit_table DCB 2,3,5,7,11,13,17,19,23,29
		
END