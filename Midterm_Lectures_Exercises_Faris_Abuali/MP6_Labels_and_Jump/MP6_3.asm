; Question #3: Write a program to check wheter the entered number is even or odd.
org 100h
.data             
    strEnter DB "Enter a number", 0Dh, 0Ah, "$"
    evenStr DB "Even","$"
    oddStr DB "odd","$"
    newLine DB 0dh, 0ah, '$'
.code   
    MOV AX, @DATA
    MOV DS, AX
         
    MOV AH, 09h
    LEA DX, strEnter
    INT 21h 
    ;------- receive input number --------
    MOV AH, 01h
    INT 21h
    ;---------------   
    MOV BL, AL
    AND BL, 0001h ;if even, BL will become zero, otherwise, BL will become 1
    JZ even
    
    ; --- if reaches here, then number is odd:
    MOV AH, 09h 
    LEA DX, newLine
    INT 21h
    LEA DX, oddStr
    INT 21h
    JMP exit
    
    even: 
    MOV AH, 09h 
    LEA DX, newLine
    INT 21h
    LEA DX, evenStr
    INT 21h
    JMP exit
    
    exit:
    MOV AH, 04Ch
    INT 21h 
ret




