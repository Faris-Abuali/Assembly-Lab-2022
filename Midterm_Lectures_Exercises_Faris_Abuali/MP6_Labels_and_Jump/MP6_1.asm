; Question #1: Write a program that allows user to enter a number and print positive, negative or Zero?


org 100h

.data             
    strEnter DB "Please enter a number:", 0Dh, 0Ah, "$"
    strPos DB "Positive Number", 0Dh, 0Ah,"$"
    strNeg DB "Negative Number",0Dh, 0Ah,"$"
    strZero DB "Entered Number is Zero",0Dh, 0Ah,"$"
    newLine DB 0dh, 0ah, '$'
.code        
    MOV AH, 09h
    LEA DX, strEnter
    INT 21h 
    ;------- receive input number --------
    MOV AH, 01h
    INT 21h
    ;---------------  
    SUB AL, 30h  ; convert the ASCII to the corresponding number
    MOV AH, 09h

    
    CMP AL, "-"
    JA nega
    
    CMP AL, 0
    JE zero 
    
    CMP AL, '-'
    JE nega
    
    ; --- if reaches here, then number is positive ---         
    LEA DX, strPos
    INT 21h
    ret
    
    nega:
    LEA DX, strNeg  
    INT 21h
    ret
        
    zero:
    LEA DX, strZero
    INT 21h
    ret                 

ret




