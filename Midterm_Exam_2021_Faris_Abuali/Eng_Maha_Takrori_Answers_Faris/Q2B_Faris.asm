;Faris H. Abuali | 23-Apr-2022

org 100h

.data
    newLine DB 0Ah, 0Dh, "$"  
    NL equ 0Ah ;NL = New Line
    CR equ 0Dh ;CR = Carriage Return 
    str DB "assembly Language", "$"
    strLen DW $ - str - 1, "$"
    strEnter DB "Enter a character: ", "$"
    strCount DB NL, CR, "The count of this letter is: ","$"
    letter DB ?,"$"   
    count DB 0,"$"

.code
    MOV AX, @DATA
    MOV DS, AX 
    
    ; -- print the string --
    LEA DX, str 
    MOV AH, 09h
    INT 21h 
    ; -- print new line --
    LEA DX, newLine
    MOV AH, 09h
    INT 21h 
    
    ; -- print the strEnter --
    LEA DX, strEnter 
    MOV AH, 09h
    INT 21h 

    
    ; -- receive input character --
    MOV AH, 01h
    INT 21h 
    
    MOV letter, AL 
    
    MOV CX, strLen  
    LEA SI, str
    
    here:    
        MOV BL, [SI]
        CMP letter, BL
        JE found
        JMP notFound
                     
        found:
            MOV AL, count
            INC AL
            MOV count, AL
        notFound:  
        INC SI   
    Loop here  
    
    ; -- print strCount ---
    LEA DX, strCount
    MOV AH, 09h
    INT 21h
    
    ; -- print the count
    MOV DL, count  
    ADD DL, 30h
    MOV AH, 02h
    INT 21h
    
ret




