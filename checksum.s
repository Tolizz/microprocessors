
	AREA mycode, CODE, READONLY
	EXPORT bonus
		
bonus PROC
	MOVS R1, #0		; set to zero
	MOV R2, #0xAA	; salt constant
	
checksum_loop
	LDRB R3, [R0]	; load current byte (character)
	CMP R3, #0		; check for null character
	BEQ checksum_done	
	
	EORS R3, R2		; R3 = char X0R salt
	EORS R1, R3		; R1 = total checksum XOR new result
	
	ADDS R0, R0, #1	; increase pointer by one
	B checksum_loop	; repeat loop
	
checksum_done

;	LDR R2, =mem_checksum
;    STR R1, [R2]
	
	MOV R0, R1
	BX LR
	
	ENDP

;mem_checksum DCD 0

END