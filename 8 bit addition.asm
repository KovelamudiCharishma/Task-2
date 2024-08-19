org 100h    ; Start address for the program
; Define the two 8-bit numbers to add
num1 db 24h    ;First number (hexadecimal)
num2 db 29h    ;Second  number (hexadecimal) 

start:
    mov al, num1    ; Load the first number into register AL
    add al, num2    ; add the second number to AL 
      
    ; result is now in AL
    ; convert the result to a convertible ASCII value for display  
    
    ;Save the result for display
    mov bl, al                                                    
    
    
    ;Convert the upper nibble(4 bits) of AL to a character
    mov ah, al
    and ah, 0F0h     ; Mask the lower nibble
    shr ah,4         ; Shift right by 4 to get upper nibble
    add ah, 30h      ; Convert to ASCII digit(0-9)
    cmp ah, 39h    
    jle print_first_digit
    add ah,7    ; Convert to ASCII letter (A-F) if necessary
    
print_first_digit:
    mov dl, ah  ; move the first digit to AL for printing
    mov ah, 02h ; BIOS interrupt to display character
    int 21h
    
    ; Convert the lower nibble of AL to a character
    mov ah, bl
    and ah, 0Fh ; mask the upper nibble
    add ah, 30h ; Convert to ASCII digit(0-9) 
    cmp ah, 39h
    jle print_second_digit      
    add ah, 7 ;   Convert to ASCII letter (A-F) if necessary
print_second_digit:
    mov dl, ah  ; move the second digit to DL for printing
    mov ah, 02h ; BIOS interrupt to display character
    int 21h  
    
    ;End of the program
    mov ah,4Ch ; terminate the program
    int 21h