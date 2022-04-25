; Question #1: Write a program that allows user to enter a number and print positive, negative or Zero?


org 100h

.data         
    NL equ 0Ah
    CR equ 0Dh            
    strEnter DB "Please enter a number:", 0Dh, 0Ah, "$"
    strPos DB NL, CR, "Positive Number", 0Dh, 0Ah,"$"
    strNeg DB NL, CR, "Negative Number",0Dh, 0Ah,"$"
    strZero DB NL, CR, "Zero",0Dh, 0Ah,"$"
    newLine DB 0dh, 0ah, '$'
.code        
    MOV AH, 09h
    LEA DX, strEnter
    INT 21h 
    ;------- receive input number --------
    MOV AH, 01h
    INT 21h
    ;---------------  
    ;SUB AL, 30h  ; convert the ASCII to the corresponding number
    MOV AH, 09h

    
    CMP AL, "0"
    JE zero 
    
    CMP AL, "0"
    JA pos
    
    ; --- if reaches here, then number is negative ---         
    LEA DX, strNeg
    INT 21h
    JMP exit
    
    pos:
    LEA DX, strPos  
    INT 21h
    JMP exit
        
    zero:
    LEA DX, strZero
    INT 21h
    JMP exit 
    
    
    exit:
        MOV AH, 04Ch
        INT 21h               

ret
