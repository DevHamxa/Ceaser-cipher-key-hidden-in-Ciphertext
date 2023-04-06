;Prototype 2
;   Ceaser Cipher with key encrypted into string.
;M.Abdullah Zahid(19-CS-54),
;M.Hamza Fayyaz(19-CS-20),
;Saad Zafar(19-CS-12),
;Sohail Asghar(19-CS-18),
;Ali Sher(19-CS-37).

org 100h
.model small
.stack 100h
.data 
      str1          db "SELECT A CHOICE: $"   
      Choicedisplay db "SELECT ONE OF THE CHOICES GIVEN ABOVE:   $" 
      str2          db "1.  ENCRYPT KEY $"
      str3          db "2.  DECRYPT KEY$"  
      str4          db "3.  EXIT PROGRAM $"   
      str5          db "ENTER THE STRING TO BE ENCRYPTED:   $"
      str6          db "ENTER THE STRING TO BE DECRYPTED:   $"
      str7          db "ENTER THE KEY:   $"  
      str8          db "ENCRIPTED:   $"
      str9          db "DECRIPTION:   $"
      lbk           db 10, 13, "$"
      
      Inputstring   dw 100 dup('$')
      Outputstring  dw 100 dup('$') 
      Keystring     dw 2 dup('$')
      Strlen        dw ? 
      KeyStrlen     dw ?
      Decimalpoint  dw 1
      key           dw 0
      bool          db 0
.code
main proc
    
    mov ax, @data 
    mov ds, ax 
    
    restartwholeprog:       
    
        mov bool, 0    
        call DisplayChoice      
        cmp bool, 1        
            
    je restartwholeprog
            
    mov ah, 4ch
    int 21h    

main endp

DisplayChoice proc                         ;CHOICE SELECTION
                  
    lea dx, str1
    mov ah, 9
    int 21h              
    
    lea  dx, lbk
    mov  ah, 9
    int 21h 
    
    lea dx, str2
    mov ah, 9
    int 21h 
    
    lea  dx, lbk
    mov  ah, 9
    int 21h
    
    lea dx, str3
    mov ah, 9
    int 21h 
    
    lea  dx, lbk
    mov  ah, 9
    int 21h
    
    lea dx, str4
    mov ah, 9
    int 21h
    
    lea  dx, lbk
    mov  ah, 9
    int 21h 
    
    lea  dx, lbk
    mov  ah, 9
    int 21h
    
    lea dx, Choicedisplay
    mov ah, 9
    int 21h 
   
    mov ah, 1
    int 21h  
    sub al, 48
    
    cmp al, 1
    je CENCRYPT
    cmp al, 2
    je CDECRYPT
    cmp al, 3
    je CEXIT
    jne CERROR
    
    CENCRYPT:   
             call EncryptingFun
             call Restartprog
             ret 
    CDECRYPT: 
             call DecryptingFun
             call Restartprog 
             ret
    CEXIT:   
             mov bool, 0 
             ret         
    CERROR:    
             lea  dx, lbk
             mov  ah, 9
             int 21h
             call reset
             
           
    ;Choice the end 
    ret    
DisplayChoice endp


EncryptEnterdata proc                          ;Function to enter data
     
   EncryptEnterAgain:  
   
        lea  dx, lbk
        mov  ah, 9
        int 21h
        
        lea dx, str5
        mov ah, 9
        int 21h
    
        lea si, Inputstring
        mov cx, 0
        L1: 
            mov ah, 1
            int 21h   
            
            cmp al, 13
            je EncryptendL1
            
            mov [si], al 
            inc si 
            inc cx
            jmp L1 
         
         
        EncryptendL1:
            cmp cx, 0
            je EncryptEnterAgain
            
            mov Strlen, cx 
    
            lea  dx, lbk
            mov  ah, 9
            int 21h

    ret    
EncryptEnterdata endp



DecryptEnterdata proc                          ;Function to enter data
     
   DecryptEnterAgain:
        
        lea  dx, lbk
        mov  ah, 9
        int 21h
        
        lea dx, str6
        mov ah, 9
        int 21h 
        
        lea si, Inputstring
        mov cx, 0
        DecryptL1: 
            mov ah, 1
            int 21h   
            
            cmp al, 13
            je DecryptendL1
            
            mov [si], al 
            inc si 
            inc cx
            jmp DecryptL1 
         
         
        DecryptendL1:
            cmp cx, 0
            je DecryptEnterAgain
            
            mov Strlen, cx 
    
            lea  dx, lbk
            mov  ah, 9
            int 21h

    ret    
DecryptEnterdata endp



Enterkey proc                          ;Functio to enter key
     
   EnterAgain2:
        
        lea  dx, lbk
        mov  ah, 9
        int 21h
        
        lea dx, str7
        mov ah, 9
        int 21h
        
        lea si, Keystring
        mov cx, 0
        Lo1: 
            mov ah, 1
            int 21h   
            
            cmp al, 13
            je endL1
            
            mov [si], al 
            inc si 
            inc cx
            jmp Lo1 
         
         
        endL1:
            cmp cx, 0
            je EnterAgain2
            cmp cx, 3
            jge EnterAgain2 
            
            mov KeyStrlen, cx
             
            lea  dx, lbk
            mov  ah, 9
            int 21h
            call string2number
    ret    
Enterkey endp



EncryptingFun proc                      ;Function to encrypt the string
    
    call EncryptEnterdata  
    call Enterkey             
    
    ;...................................   
    lea di, Outputstring 
    lea si, Keystring
    call movKeyToOutput
    
    lea si, Inputstring
    mov cx, Strlen
    EnLoop:
        mov dx, 0
        mov dx, [si]   
        
        mov dh, 0 
        
        cmp dx, 65
        jl  Moveon
        
        cmp dx, 91
        jl  AddkeyUpper
             
        cmp dx, 97
        jl Moveon
    
        cmp dx, 122
        jg Moveon
        
                    
        AddkeyLower:       
            add dx, key
            
            cmp dx, 123
            jl LowerElse
            
            sub dx, 122
            add dx, 96
            
            LowerElse:
                ;mov ah, 2
                ;int 21h
                jmp Moveon
         
         
        AddkeyUpper:       
            add dx, key
            
            cmp dx, 91
            jl UpperElse
            
            sub dx, 90
            add dx, 64
            
            UpperElse:
                ;mov ah, 2
                ;int 21h
        
        Moveon:
            mov [ di ], dx
            inc si
            inc di
            loop Enloop
            
            lea dx, lbk
            mov ah, 9
            int 21h
            
            lea dx, str8 
            mov ah, 9
            int 21h
            
            call DisplayOutput
            
            lea dx, lbk
            mov ah, 9
            int 21h
            lea dx, lbk
            mov ah, 9
            int 21h
    
   ret    
EncryptingFun endp    

                    
                    
                    
                    
DecryptingFun proc                    ;Function to decrypt the string
    
    call DecryptEnterdata
    
    ;................................... 
    lea di, Keystring
    lea si, Inputstring
    call ExtractKey
    lea si, Inputstring
    lea di, Outputstring
    inc si
    inc si
    sub Strlen, 2
    mov cx, Strlen
    DeLoop:
        mov dx, 0
        mov dx, [si]   
        
        mov dh, 0 
        
        cmp dx, 65
        jl  Moveon2
        
        cmp dx, 91
        jl  SubkeyUpper
             
        cmp dx, 97
        jl Moveon2
    
        cmp dx, 122
        jg Moveon2
        
                    
        SubkeyLower:       
            sub dx, key
            
            cmp dx, 96
            jg Moveon2
            
            sub dx, 97
            add dx, 123
            jmp Moveon2 
         
        SubkeyUpper:       
            sub dx, key
            
            cmp dx, 64
            jg Moveon2
            
            sub dx, 65
            add dx, 91
        
        Moveon2:
            mov [ di ], dx
            inc si  
            inc di
            loop DeLoop
            
            lea dx, lbk
            mov ah, 9
            int 21h
            
            lea dx, str9 
            mov ah, 9
            int 21h
            
            call DisplayOutput
            
            lea dx, lbk
            mov ah, 9
            int 21h
            lea dx, lbk
            mov ah, 9
            int 21h
    
   ret    
DecryptingFun endp
 


movKeyToOutput proc                    ;Display Output
       
      mov cx, KeyStrlen
      cmp cx, 2
      je movKeyToOutput_loop
      
      mov  [ di ], 97
      inc di
                  
      movKeyToOutput_loop:
          mov  bl, [ si ]
          sub bl, 48
          
              cmp bl, 0
              jne notmova 
              mov  bl, 'a'
              jmp notmov
          
          notmova:
              cmp bl, 1 
              jne notmovb
              mov  bl, 'b'
              jmp notmov
          
          notmovb: 
              cmp bl, 2 
              jne notmovc
              mov  bl, 'c'
              jmp notmov
          
          notmovc: 
              cmp bl, 3
              jne notmovd
              mov  bl, 'd'
              jmp notmov
           
          notmovd:
              cmp bl, 4
              jne notmove
              mov  bl, 'e' 
              jmp notmov 
              
          notmove:
              cmp bl, 5 
              jne notmovf 
              mov  bl, 'f'
              jmp notmov
              
          notmovf:
              cmp bl, 6
              jne notmovg 
              mov  bl, 'g' 
              jmp notmov
          
          notmovg:
              cmp bl, 7 
              jne notmovh
              mov  bl, 'h' 
              jmp notmov
          
          notmovh: 
              cmp bl, 8 
              jne notmovi
              mov  bl, 'i'
              jmp notmov
          
          notmovi: 
              cmp bl, 9
              jne notmov
              mov  bl, 'j'
           
          notmov:
           
          mov  [ di ], bl  
          inc si
          inc di   
          
      loop movKeyToOutput_loop   
      
      
                                
   ret    
movKeyToOutput endp




ExtractKey proc                    ;EXTRACTS KEY FROM THE DECRIPTION
      
      mov KeyStrlen, 2 
      mov cx, KeyStrlen             
      ExtractKey_loop:
          mov bl, [ si ]
          
              cmp bl, 'a'
              jne notmov0 
              mov  bl, 0
              jmp notmoved
          
          notmov0:
              cmp bl, 'b' 
              jne notmov1
              mov  bl, 1
              jmp notmoved
          
          notmov1: 
              cmp bl, 'c' 
              jne notmov2
              mov  bl, 2
              jmp notmoved
          
          notmov2: 
              cmp bl, 'd'
              jne notmov3
              mov  bl, 3
              jmp notmoved
           
          notmov3:
              cmp bl, 'e'
              jne notmov4
              mov  bl, 4 
              jmp notmoved 
              
          notmov4:
              cmp bl, 'f' 
              jne notmov5 
              mov  bl, 5
              jmp notmoved
              
          notmov5:
              cmp bl, 'g'
              jne notmov6 
              mov  bl, 6 
              jmp notmoved
          
          notmov6:
              cmp bl, 'h' 
              jne notmov7
              mov  bl, 7 
              jmp notmoved
          
          notmov7: 
              cmp bl, 'i' 
              jne notmov8
              mov  bl, 8
              jmp notmoved
          
          notmov8: 
              cmp bl, 'j'
              jne notmoved
              mov  bl, 9
           
          notmoved:
          
          add bl, 48 
          mov [ di ], bl 
          inc si
          inc di   
          
      loop ExtractKey_loop
   call string2number                             
   ret    
ExtractKey endp

 
 
DisplayOutput proc                    ;Display Output
                  
      lea dx, Outputstring
      mov ah, 9
      int 21h
                                   
   ret    
DisplayOutput endp



string2number proc                     ;Convert Key String in to Numarical value
    
    lea si, Keystring
    mov cx, 0
    string2numberloop:
         mov dx, 0 
         mov dx, [ si ]
         sub dx, 48
         mov dh, 0
         push dx
         inc si
         inc cx  
         
         cmp  cx, KeyStrlen  
    jne  string2numberloop
    
    
    string2numbercycle2: 
        mov ax, Decimalpoint 
        pop bx
        mul bx
        add key, ax
        cmp cx, 1
        je resetout
         
        mov ax, 10
        mul Decimalpoint
        mov Decimalpoint, ax 
        resetout:
            mov ax, 0
            mov bx, 0
            mov dx, 0 
        
    loop string2numbercycle2    
        
   ret     
string2number endp 
         
    
 
dollarsin proc                        ;Stores Dollar Signs in the Inputstring
                    
      mov  cx, 100
      mov  di, offset Inputstring
      dollars_loopin:      
          mov  bl, '$' 
          cmp [ di ], bl
          je dollars_loopinExit
          mov  [ di ], bl
          inc  di   
          
      loop dollars_loopin
       
  dollars_loopinExit: 
     
  ret        
dollarsin endp 


dollarsout proc                        ;Stores Dollar Signs in the Outputstring
                    
      mov  cx, 100
      mov  di, offset Outputstring
      dollars_loopout:      
          mov  bl, '$'
          cmp [ di ], bl
          je dollars_loopoutExit
          mov  [ di ], bl
          inc  di   
          
      loop dollars_loopout
       
  dollars_loopoutExit:
      
  ret        
dollarsout endp 


dollarskey proc                        ;Stores Dollar Signs in the Outputstring
                    
      mov  cx, 2
      mov  di, offset Keystring 
      dollars_loopkey:      
          mov  bl, '$'
          cmp [ di ], bl
          je dollars_loopkeyExit
          mov  [ di ], bl
          inc  di   
          
      loop dollars_loopkey
       
  dollars_loopkeyExit:
      
  ret        
dollarskey endp


reset proc
    
     mov ax, 0
     mov cx, 0
     mov bx, 0
     mov dx, 0
    
    ret
reset endp



Restartprog proc                      ;Function to restart the program
    call dollarsin
    call dollarsout  
    call dollarskey                
    call reset
    mov  bool, 1
    mov  Strlen, 0  
    mov  KeyStrlen, 0
    mov  Decimalpoint, 1 
    mov  key, 0        
   ret    
Restartprog endp


end main