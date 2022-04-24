;Faris H. Abuali | 23-Apr-2022

org 100h

.data
    newLine DB 0Ah, 0Dh, "$"  
    NL equ 0Ah ;NL = New Line
    CR equ 0Dh ;CR = Carriage Return 
    str DB "HuThAiFa", "$"
    strLen DW $ - str - 1, "$"


.code
    MOV AX, @DATA
    MOV DS, AX 
    
    MOV CX, strLen  
    LEA SI, str
    
    here:    
        MOV BL, [SI]
        CMP BL, "A"
        JAE test1
        
        
        test1:
            CMP BL, "Z"
            JBE upper
            JMP test2
              
        test2:
            CMP BL, "a"
            JAE test3
            JMP skip
        
        test3:
            CMP BL, "z"
            JBE lower
            JMP skip
        
        upper:
          ADD BL, 20h
          MOV [SI], BL   
          JMP skip
        lower:       
          SUB BL, 20h 
          MOV [SI], BL
          JMP skip
                     
        skip:
        ; --- print the char ---
        MOV DL, BL
        MOV AH, 02h
        INT 21h
        INC SI
    Loop here  
    
ret




