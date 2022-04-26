org 100h

.data
   str DB "FARIS", "$"

.code
    MOV DL, "F" 
    MOV AH, 02h  ; will print the content of DL onto the terminal (console)              
    INT 21h
    MOV AH, 05h  ; will print the content of DL onto the printer (output device) instead of the terminal
    INT 21h  
    ;Note: The printer is an output device which is connected to the microprocessor on port: 130d   
    
    ;---- Another way to print onto the printer is by using the OUT instruction and specifying the port of the printer: ---
    MOV AL, "F"  ; Notice here we MOV AL (not MOV DL)
    OUT 130d, AL ; print the content of AL onto the device which is connected to the microprocessor on port: 130d
    ; Note: The printer is conntected to the microprocessor on port: 130d   
    ; Note: When using OUT, the 2nd parameter can be either AL or AX only. 
    ; Recap: OUT portNumber, AL  or OUT portNumber, AX
ret




