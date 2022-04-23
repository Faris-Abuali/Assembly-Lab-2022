; Question #1A: Write a program to print the numbers from 1 to 9 using Loop instruction.

org 100h

.data
   newLine DB 0dh, 0ah, '$'
.code        
    MOV CX, 9
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
	Loop print    
ret




