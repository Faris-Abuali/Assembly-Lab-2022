; Question #2: Write a program to print the characters from a to z 
; except ( a, e, i, o, u ) using Loop instruction.

org 100h

.data
   newLine DB 0dh, 0ah, '$'
.code        
    MOV CX, 26
    MOV BL, 'A'  
    ; I will store the letters in BL, not DL,
    ; because I might need DL to print some other things such as new Line
    MOV AH, 02h
    print: 
        MOV AH, 02h      
        CMP BL, 'A'     
        JE skip
        CMP BL, 'E'     
        JE skip
        CMP BL, 'I'     
        JE skip
        CMP BL, 'O'     
        JE skip
        CMP BL, 'U'     
        JE skip  
        
        ;-- print the letter ---       
        MOV DL, BL       
        INT 21h
        ;--- print the lowercase version :) ---
        ADD DL, 20h
        INT 21h
        ;--- print new line ----
        LEA DX, newLine
        MOV AH, 09h
        INT 21h 
        
        skip:
        INC BL
	Loop print    

ret




