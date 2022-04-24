;Faris H. Abuali | 23-Apr-2022

org 100h

.data
    newLine DB 0Ah, 0Dh, "$"  
    NL equ 0Ah ;NL = New Line
    CR equ 0Dh ;CR = Carriage Return 
    str DB "Enter 3 numbers: ", "$" 
    strMsg DB NL, CR, "The min number = ", "$"
    min DB 0FFh

.code
    MOV AX, @DATA
    MOV DS, AX 
    
    MOV CX, 03h
    here:
        ; -- receive a char --
        MOV AH, 01h
        INT 21h
        SUB AL, 30h ;convert ASCII to number
        CMP AL, min
        JAE skip

        ; -- if reahces here, then update the minimum: --
        MOV min, AL  
            
        skip:
    Loop here
    
    
    ; --- print strMsg --- 
    LEA DX, strMsg
    MOV AH, 09h
    INT 21h
    ; --- print the min --  
    MOV AH, 02h
    MOV DL, min
    ADD DL, 30h ;convert the number to ASCII
    INT 21h
     
    exit:
        MOV AH, 04Ch
        INT 21h 
ret




