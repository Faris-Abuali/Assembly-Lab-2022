; Question #2: Write a program that allow user to enter character and print vowel or Not


org 100h

.data             
    strEnter DB "Please enter a letter:", 0Dh, 0Ah, "$"
    strVowel DB "Vowel","$"
    strNotVowel DB "Not Vowel","$"
    newLine DB 0dh, 0ah, '$'
.code   
    MOV AX, @DATA
    MOV DS, AX
         
    MOV AH, 09h
    LEA DX, strEnter
    INT 21h 
    ;------- receive input letter --------
    MOV AH, 01h
    INT 21h
    ;---------------   
    MOV BL, AL
    CMP BL, "A"
    JE vowel:
    
    CMP BL, "E"
    JE vowel:
    
    CMP BL, "I"
    JE vowel:
    
    CMP BL, "O"
    JE vowel:
    
    CMP BL, "U"
    JE vowel:    
     
    ; -- if reaches here, then not vowel: 
    MOV AH, 09h
    LEA DX, newLine
    INT 21h
    LEA DX, strNotVowel
    INT 21h  
    JMP exit
    
    vowel:
    MOV AH, 09h
    LEA DX, newLine
    INT 21h
    LEA DX, strVowel
    INT 21h   
    
    exit:
    MOV AH, 04Ch
    INT 21h
    
   
ret




