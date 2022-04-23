; Question #1
; What is the result of this expression: 5 - 2 + 3 * 6 / 2 

org 100h

.data            
    product DB 0,'$'   
    quotient DB 0,'$'  
    diff DB 0,'$'   
    ALcopy DB 0,'$'
    newLine DB 0dh, 0ah, '$'
.code   
    MOV AX, @DATA
    MOV DS, AX              

    ; Faris H. Abuali | 22-April-2022
     
    MOV AX, 0000h 
    MOV AL, 03h
    MOV BL, 06h
    MUL BL ;AX=AL*BL
    MOV product, AL
    ;-------- product = 18d ----------
    MOV BL, 2
    DIV BL  ;
    MOV quotient, AL  
    ;-------- quotient = 9d ----------
    MOV AL, 05h
    SUB AL, 2h
    MOV diff, AL     
    ;-------- diff = 3d --------
    MOV AL, quotient
    MOV BL, diff                  
    ADD AL, BL
    ;----- quotient+diff = 12d -------------   
    
    ;---print the result----
    AAA ;AX will convert from [00 0C] to [01 02] which is twelve    
    ADD AX, 3030h  
    MOV ALcopy, AL
    MOV DL, AH
    MOV AH, 02h
    INT 21h
    MOV DL, ALcopy
    INT 21h

   exit:
        MOV AH, 04Ch
        INT 21h
ret




