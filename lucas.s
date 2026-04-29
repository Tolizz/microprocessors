
	AREA mycode, CODE, READONLY
	EXPORT lucas
		
lucas PROC
	PUSH {R4,R5,LR}
	
	; Base cases
	CMP R0,#0		; n = 0
	BEQ lucas_zero
	
	CMP R0,#1		; n = 1
	BEQ lucas_one
	
	MOV R4,R0		; save n in R4
	
	SUB R0,R4,#1	; calculate n-1
	BL lucas
	
	MOV R5,R0		; save L(n-1) in r5
	
	SUB R0,R4,#2	; calculate n-2
	BL lucas
	
	ADD R0,R0,R5	; add L(n-2) + L(n-1)
	B lucas_done

lucas_zero
	MOV R0,#2		; L(0) = 2
	B lucas_done

lucas_one			; L(1) = 1
	MOV R0,#1

lucas_done

;	LDR R1, =mem_lucas
;   STR R0, [R1]	
	
	POP {R4,R5,PC}

	ENDP
		
;mem_lucas DCD 0

END