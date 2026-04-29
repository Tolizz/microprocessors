
	AREA mycode, CODE, READONLY
	EXPORT clearance_level
		
clearance_level PROC
	MOV R1, #0		; set R1 to zero, One-bit counter
	MOV R3, R0		; R2 = hash copy
	
count_loop
	CMP R3, #0		; Check if it is the Null terminator \0
	BEQ count_done	; exit loop if the string is done
	
	MOVS R2, #1		; set R2 to 1
	AND R2, R3		; use AND to compare if R3(LSB) == 1
	ADD R1,R1,R2	; add the result to the counter (1 true, 0 false)
	LSR R3, R3, #1	; shift hash left to check next bit
	B count_loop
	
count_done			; exit point

mod_loop
	CMP R1, #6		; check if the sum is 6
	BLT mod_done	; exit if it's less than 6
	SUB R1, R1, #6	; else decrease by 6
	B mod_loop		; repeat the loop

mod_done
	
;	LDR R2, =level_result	; load memory adress
;	STR R1, [R2]			; store in memory
	
	MOV R0, R1		; the result from mod is saved in R0
	BX LR
	
	ENDP
		
;level_result DCD 0

END	
	
	