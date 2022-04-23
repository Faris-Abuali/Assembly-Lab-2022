; Question #1B: Write a program to print the numbers from 1 to 15
; using Loop instruction. (you can print each number in a separate line)


org 100h

.data
   newLine DB 0dh, 0ah, '$'
.code        
    MOV CX, 15
    MOV BX, 0001h ; I will store the number in a 2-byte register [BH, BL]
    MOV AH, 02h
    print:      
        MOV AH, 02 ;again, because the value of AH has been overriten below
        MOV DL, BH    
        ADD DL, 30h
    	INT 21h  ;print the left part of the number (ex: [05] the left part is 0)
    	;-----------
    	MOV DL, BL
    	ADD DL, 30h
    	INT 21h  ;print the right part of the number (ex: [05] the right part is 5)
    	;-----------    
    	LEA DX, newLine
    	MOV AH, 09h
    	INT 21h 
    	;-----------   
    	INC BX
    	MOV AX, BX ;because the AAA works only on AX
    	AAA        ; Adjust After Addition 
    	;AAA Corrects result in AH and AL after addition when working with BCD values.
    	;ex: AX = [00 0C] ==> [01 02] which means twelve
    	MOV BX, AX ; After the result is adjusted (corrected) in AX, copy it to BX
	Loop print    

ret

; Faris H. Abuali | 22 April 2022
