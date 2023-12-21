ORG 0000H

MOV R3, #05H

LCALL FACT
LCALL HEX2DEC

OUTER_DISP:
MOV R1, #3fH
MOV R0, 60H
MOV A, R0
ADD A, R1
MOV R1, A

DEC_DISPLAY: 
	MOV P0, @R1
	LCALL DELAY
	DEC	R1
	DJNZ R0, DEC_DISPLAY
	SJMP OUTER_DISP


DELAY:
	MOV R3, #0ffh
	DOUTER:
	MOV R4, #0ffh
	DINNER:
	DJNZ R4, DINNER
	DJNZ R3, DOUTER
RET

FACT:
	;handle 0 or 1
	MOV A, R3
	SUBB A, #02H
	JC HANDLE
	MOV A, #01H
	NEXT:
	MOV B, R3
	MUL AB
	DJNZ R3, NEXT
	MOV R4, A ;factorial
	SJMP RETURN
	HANDLE:
	MOV R4, #01H
	RETURN:
RET

HEX2DEC:
	MOV R1, #40H
	MOV 60H, #0H
	MOV A, R4
	HERE:
	MOV B, #0AH
	DIV AB
	MOV @R1, B
	INC R1
	INC 60H ;no of digits
	CLR C
	SUBB A, #0H
	JNZ HERE
RET

END