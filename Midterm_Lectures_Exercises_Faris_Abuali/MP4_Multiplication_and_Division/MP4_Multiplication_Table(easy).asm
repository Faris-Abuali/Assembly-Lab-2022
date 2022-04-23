; Question: Print the multiplication table for number 5 (from 0 to 9)
;--------------
; 0x5=0
; 1x5=5
; 2x5=10
; ...
; 9x5=45
;--------------
org 100h

.data             
    strEnter DB "Enter a letter", 0Dh, 0Ah, "$" 
    current DB 0,'$' 
    newLine DB 0dh, 0ah, '$'
.code   
    MOV AX, @DATA
    MOV DS, AX
         
    MOV CX, 10
    MOV BX, 0005h   ;Multiplication table for number: 5  (BL is fixed at 5, and BH will vary from 0 to 9)
    label:   
        MOV BL, 05h ;BL is fixed at 5  
        MOV BH, current
        ; --- print left number (BH) ---  
        MOV AH, 02h
        MOV DL, BH 
        ADD DL, 30h
        INT 21h 
        ; --- print "*" ---
        MOV DL, "*"
        INT 21h                   
        ; --- print right number (BL) ---
        MOV DL, BL   
        ADD DL, 30h
        INT 21h 
        ; --- print "=" ---
        MOV DL, "="
        INT 21h
        ; --- Now, execute multiplication: ----   
        MOV AL, BH
        MUL BL  ; AL = AL*BL = BH*BL (and remainder in AH (if any))  
        ; --- Result is ready in AX, but we need to adjust (correct) it:
        AAM ; correct AX (ex: [00 0F] --> [01 05]) which is Fifteen in BCD format
        ; -- Now move the result to BX ---
        MOV BX, AX
        ; -- convert to ASCII ---
        ADD BX, 3030h ; for ex: BX: [01 05] --> BX: [31 35]
        ; -- Now print the product result as 2 digits: 
        MOV AH, 02h
        ; --- left digit:
        MOV DL, BH
        INT 21h
        ; --- right digit
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




