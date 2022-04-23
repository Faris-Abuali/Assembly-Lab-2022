; Question: Write a program that gets a character and converts from upper to lower 
; if it is upper, or converts form lower to upper if it is lower 
; Note :Using Logical & conditional operations 


org 100h

.data             
    strEnter DB "Enter a letter", 0Dh, 0Ah, "$" 
    strInvalid DB "Invalid Input", 0Dh, 0Ah, "$" 
    newLine DB 0dh, 0ah, '$'
.code   
    MOV AX, @DATA
    MOV DS, AX
         
    MOV AH, 09h
    LEA DX, strEnter
    INT 21h     ;------- receive input --------
    MOV AH, 01h
    INT 21h
    ;---------------   
    MOV BL, AL            
    CMP BL, "A"
    JAE test1 
    CMP BL, "A"
    JB invalid

    
    test1:
        CMP BL, "Z"
        JBE upper 
        CMP BL, "a"
        JAE test2 
        JMP invalid
    
    test2:
        CMP BL, "z"
        JBE lower
        JMP invalid
        
        
    upper: 
        ADD BL, 20h ;to convert upper to lower (ex: A(41) --> a(61))
        JMP printLetter
           
        
    lower: 
        SUB BL, 20h ;to convert lower to upper  (ex: a(61) --> A(41))
        JMP printLetter 
        
    printLetter:
        ;-- print new line -- 
        LEA DX, newLine
        MOV AH, 09h
        INT 21h
        ; -- print the letter -- 
        MOV DL, BL
        MOV AH, 02h
        INT 21h   
        JMP exit
        
    invalid:  
        ;-- print new line -- 
        LEA DX, newLine
        MOV AH, 09h
        INT 21h  
        ; -- print invalid message -- 
        LEA DX, strInvalid
        MOV AH, 09h
        INT 21h 
        JMP exit
        
   exit:
        MOV AH, 04Ch
        INT 21h
ret




