;Faris H. Abuali | 23-Apr-2022

org 100h

.data   
    number DB 47, "$"

.code
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AX, 0000h
    MOV AL, number     
    AAM  ;Adjust After Multiplication (AH = AL/10) and (AL = AL%10)
    ADD AX, 3030h ;to convet the numbers to their ASCII codes
    MOV BX, AX    ;Save the result in BX, because AX content will be changed by the INT 21h
    MOV DL, BH    ;Prepare to print the first digit (the left digit)
    MOV AH, 02h
    INT 21h
    MOV DL, BL    ;Prepare to print the second digit (the right digit)
    INT 21h
ret




