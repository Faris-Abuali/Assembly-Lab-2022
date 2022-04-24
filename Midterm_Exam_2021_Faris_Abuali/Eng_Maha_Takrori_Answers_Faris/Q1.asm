;Faris H. Abuali | 23-Apr-2022

org 100h

.data   
    NL equ 0Ah ; NL = New Line
    CR equ 0Dh ;CR = Carriage Return 
    newLine DB 0Dh, 0Ah, "$"
    strEnter DB "Enter the numbers: ","$"
    strProblem DB CR, NL, "There is a problem","$"
    strResult DB CR, NL, "The sum is: ","$"
    sum DB ?,"$"

.code
    MOV AX, @DATA
    MOV DS, AX
    MOV CX, 3
    
    ; --- print strEnter ---
    LEA DX, strEnter
    MOV AH, 09h
    INT 21h
    
    here:
        MOV AH, 01h
        INT 21h ;receive a byte from user
        MOV BL, sum
        SUB AL, 30h ;convert the ASCII to the corresponding number
        ADD AL, BL  ;AL = AL+BL = AL+sum
        MOV sum, AL
        
        CMP sum, 10
        JAE problem
    Loop here 
    
      ; --- print strResult ---
      MOV AH, 09h 
      LEA DX, strResult
      INT 21h
      ; --- print sum --- 
      MOV DL, sum 
      ADD DL, 30h ;Don't forget to convert the number to ASCII
      MOV AH, 02h
      INT 21h
      JMP exit
    
    problem:
        ; --- print strEnter ---  
        LEA DX, strProblem
        MOV AH, 09h
        INT 21h
        JMP exit
        
    exit:
        MOV AH, 04Ch
        INT 21h   
ret


