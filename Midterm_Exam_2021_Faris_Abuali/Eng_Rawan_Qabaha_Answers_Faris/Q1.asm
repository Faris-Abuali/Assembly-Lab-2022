;Faris H. Abuali | 23-Apr-2022

org 100h

.data
    newLine DB 0Ah, 0Dh, "$"  
    NL equ 0Ah ;NL = New Line
    CR equ 0Dh ;CR = Carriage Return 
    strEnter DB "Enter a number: ","$"
    strPrime DB CR, NL, "Yes, it is a prime number",CR,NL,"$"
    strNotPrime1 DB CR, NL, "No, it is NOT prime. It has ","$"      
    strNotPrime2 DB " factor(s) except 1 and the number itself","$"
    factorsCount DB ?, "$"  
    number DB ?, "$"


.code
    MOV AX, @DATA
    MOV DS, AX 
    
    ; --- print strEnter ---
    LEA DX, strEnter
    MOV AH, 09h
    INT 21h
    
    ; -- receive a number (byte as ASCII) ---
    MOV AH, 01h
    INT 21h
    SUB AL, 30h ;convert the ASCII to number
    MOV number, AL
    
    ; -- start a loop from (number - 1) to 2 --
    MOV CX, 0000h
    MOV CL, number
    DEC CL
    
    here: 
       CMP CX, 1
       JE done  
       
       MOV AX, 0000h
       MOV AL, number    
       DIV CL ; [Ah:AL] = AL/CL = number/CL    
       ; -- check if there is a remainder in AH --
       CMP AH, 0 
       JE factorFound 
       JMP done
       
       factorFound:
            INC factorsCount 
       done:
    Loop here
    
    ; -- if factorsCount = 0, then the number is prime --
    CMP factorsCount, 0
    JNE notPrime:                                 
    
   ; --- if reaches here, then number is prime --- 
    LEA DX, strPrime
    MOV AH, 09h
    INT 21h
    JMP exit
    
    notPrime:
    ; --- print first part of the sentence -- 
        LEA DX, strNotPrime1
        MOV AH, 09h
        INT 21h  
    ; --- print number of factors --
        MOV DL, factorsCount
        ADD DL, 30h ;convert number to ASCII
        MOV AH, 02h                         
        INT 21h  
     ; --- print second part of the sentence -- 
        LEA DX, strNotPrime2
        MOV AH, 09h
        INT 21h 
        
    exit:
        MOV AH, 0C4h
        INT 21h 
ret




