; Question #2 (Assignment):
; What is the result of this expression: 12 * (200 – 225) + 127


org 100h

.data


.code
    MOV AX, @DATA
    MOV DS, AX 
    
    ; --- (200 - 225) ---
    MOV BL, 200	
    MOV CL, 225
    SUB BL, CL    ; BL = 200 - 225 = -25 = (E7) with SF=1 (-ve) and CF=1 (borrow)
    
    ; --- 12 * (200 - 225) ---
    MOV AX, 0000h
    MOV AL, 12d
    MUL BL ; AX = AL*BL=12d*(-25d)  
    
    ; --- 12 * (200 - 225) + 127 --- 
    MOV BX, 127d
    ADD AX, BX
    
    ; Final result will be -173d, which is = 53h and the Sign Flag (SF) = 1 to indicate that the result is negative

    
    exit:
        MOV AH, 04Ch
        INT 21h 
ret




