; Question: Print the multiplication table for number 5 (from 0 to 19)
;--------------
; 00x5=0
; 01x5=5
; 02x5=10
; ...
; 09x5=45
; 10x5=50
; ...
; 19x5=95
;--------------



org 100h

.data             
    strPrepared DB "Multiplication Table for number 5 (from 0 to 19)", 0Dh, 0Ah, "$" 
    current DB 0,'$' ;to store the current number from 0 to 19      
    AHcopy DB 0,'$'
    ALcopy DB 0, '$'
    newLine DB 0dh, 0ah, '$'
.code   
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, strPrepared
    MOV AH, 09h
    INT 21h
    
         
    MOV CX, 20d
    MOV BX, 0005h   ;Multiplication table for number: 5  (BL is fixed at 5, and BH will vary from 0 to 9)
    label:   
        MOV BL, 05h ;BL is fixed at 5  
        MOV BH, current ; BH will vary from 0 to 19 
        ; --- print left number (BH) ---     
        ; if the left number is > 9, then it needs to be adjusted before printing:
        MOV AL, current
        AAM  ; Adjust After Multiplication (ex: AX: [00 0A] --> AX: [01 00]) which makes it possible to print (10x5))
        MOV AHcopy, AH
        MOV ALcopy, AL
        MOV AH, 02h  ; I saved AH and AL in variables because this line (MOV AH, 02h) overwrites the value of AX
        MOV DL, AHcopy ;prepare to print the left digit of the first number
        ADD DL, 30h
        INT 21h
        MOV DL, ALcopy ;prepare to print the right digit of the first number
        ADD DL, 30h
        INT 21h
        ; --- print "*" ---
        MOV DL, "*"
        INT 21h                   
        ; --- print right number (BL) which is fixed at 5 ---
        MOV DL, "5"   
        INT 21h 
        ; --- print "=" ---
        MOV DL, "="
        INT 21h
        ; --- Now, execute the multiplication operation: ----   
        MOV AL, BH
        MUL BL  ; AL = AL*BL = BH*BL = BH*5 = current*5 (and remainder in AH (if any))  
        ; --- Result is ready in AX, but we need to adjust (correct) it before printing it:
        AAM ; correct AX (ex: [00 0F] --> [01 05]) which is Fifteen in BCD format  
        ;another example AX: [00 14] which is 20 in decimal --> [02 00])
        ;algorithm is: AH = (AL as decimal) / 10, and AL = AL%10
        ; -- Now move the result to BX ---
        MOV BX, AX
        ; -- convert to ASCII ---
        ADD BX, 3030h ; for ex: BX: [01 05] --> BX: [31 35]
        ; -- Now print the product result as 2 digits: 
        MOV AH, 02h
        ; --- left digit of the product result:
        MOV DL, BH
        INT 21h
        ; --- right digit  of the product result:
        MOV DL, BL
        INT 21h 
        ; -- After printing is done, don't forget to subtract the 3030h --
        SUB BX, 3030h 
        ; --- new line
        LEA DX, newLine
        MOV AH, 09h
        INT 21h 
        INC current
    Loop label
    
   exit:
        MOV AH, 04Ch
        INT 21h
ret







