; Question #3: Write a program to print the even numbers from 0 to 9 using Loop instruction.


org 100h

.data                
    currNumber DB 0,'$'
   newLine DB 0dh, 0ah, '$'
.code        
    MOV CX, 9
    MOV BL, 0  
    MOV AH, 02h
    print: 
        MOV BL, currNumber    
        AND BL, 1  ;If BL is even, then the result in BL will be 0
        CMP BL, 0
        JNZ odd ;skip printing odd numbers  
        
        MOV DL, currNumber
        ADD DL, 30h
        INT 21h
        SUB DL, 30h    
            
        odd:   
        INC currNumber
	Loop print    

ret




