;Faris H. Abuali | 23-Apr-2022

org 100h

.data
    newLine DB 0Ah, 0Dh, "$"  
    NL equ 0Ah ;NL = New Line
    CR equ 0Dh ;CR = Carriage Return 
    str DB "acdca", "$"
    strLen DW $-str-1, "$" 
    strP DB "Palindrom", NL, CR, "$"
    strNotP DB "Not palindrom", NL, CR, "$"

.code
    MOV AX, @DATA
    MOV DS, AX 
    
    ; -- Let SI point at the first char of str -- 
    LEA SI, str   
    ; -- Let DI point at the last char of str
    MOV DI, SI
    ADD DI, strLen
    DEC DI
    
    here:
        CMP SI, DI
        JAE palindrom   
       
        MOV BL, [SI] 
        CMP BL, [DI]  ;We cannot directly CMP [SI], [DI]
        JNE notPalindrom
               
        INC SI
        DEC DI
    Loop here
        
        
    ; -- if reaches here, then the string is palindrom 
    palindrom:
        LEA DX, strP
        MOV AH, 09h
        INT 21h
        JMP exit   
    
    notPalindrom:
        ; -- print "not palindrom"  
        LEA DX, strNotP
        MOV AH, 09h
        INT 21h 
    
    exit:
        MOV AH, 04Ch
        INT 21h 
ret




