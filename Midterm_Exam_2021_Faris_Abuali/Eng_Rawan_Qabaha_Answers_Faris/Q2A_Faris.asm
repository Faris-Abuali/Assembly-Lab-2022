;Faris H. Abuali | 23-Apr-2022

org 100h

.data
    newLine DB 0Ah, 0Dh, "$"  
    NL equ 0Ah ;NL = New Line
    CR equ 0Dh ;CR = Carriage Return 
    strName DB "Faris_Abuali","$"
    strLen DB $-strName-1, "$"

.code
    MOV AX, @DATA
    MOV DS, AX 
    
    
    outer:
        MOV CX, 0000h
        MOV CL, strLen  
        LEA SI, strName 
            inner: 
              MOV DL, [SI]
              MOV AH, 02h
              INT 21h
              INC SI
            Loop inner
        ; -- decrement strLen --
        DEC strLen
        ; -- update the counter CX --
        MOV CX, 0000h
        MOV CL, strLen
        ; --- print new line ---
        LEA DX, newLine
        MOV AH, 09h
        INT 21h 
    Loop outer
    
      
    exit:
        MOV AH, 04Ch
        INT 21h 
ret




