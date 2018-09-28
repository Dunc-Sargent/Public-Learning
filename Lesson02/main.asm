;------------------------------------------------------------------------------------------------------------------
; Original author:      Dunc Sargent, dunc@tinkeri.com
; Original Repository:  https://github.com/Dunc-Sargent/Public-Learning
;
;------------------------------------------------------------------------------------------------------------------

; We're now going to use 32 bit registers (extended registers) such as eax, ebx, ecx, esi, edi.  This is because
; we're not dealing with offsets into our memory space.

.386
.model flat, stdcall
ExitProcess proto, dwExitCode:dword

;------------------------------------------------------------------------------------------------------------------
.stack 4096                     ; -- our stack segment --

;------------------------------------------------------------------------------------------------------------------
.data                           ; -- our data segment -- 

src byte "quick fox"            ; declare a fixed string named 'SrcString'  
                                ; its length is fixed at assembly time
    byte 0                      ; null terminate the string (comment this line out for your second run of this 
                                ; program to see the effect of not null terminating a string)

dst byte 64 dup ('M')           ; declare an array of bytes 256 long, all initialized to 'M'
                                ; (?) for unitialized
                                ; (0) for nice clean buch'o'nutin'

;------------------------------------------------------------------------------------------------------------------
.code                           ; -- our code segment -- 

MAIN proc                       ; marks start and end of a procedure block called <label>. The statements in the 
                                ; block can be called with the CALL instruction or INVOKE directive
                                ; See also:
                                ;   https://docs.microsoft.com/en-us/cpp/assembler/masm/proc?view=vs-2017

    int     3   ; add a couple watches in the Debugger Watch window:
                ;   &src,s
                ;   &dst,s
                ; compare these strings

;-----------------------------------
; initialize dst to all FF 
; (just to get used to a loop)
;-----------------------------------
    mov     edi, offset dst
    mov     ecx, 63                     ; dst is 64 bytes, we're using ecx as an index, so thats 0..63
BEG_INITIALIZE_DST:                     ; a label we can jump to (the top of our do-while loop)
    mov     byte ptr [edi + ecx], 0FFh  ; set the byte to FF (immediate value must begin with 0 if 
                                        ; next character is a alphabetic character)
    cmp     ecx, 0                      ; compare ecx to 0 (this sets flags)
    jle     END_INITIALIZE_DST          ; decrement ecx
    dec     ecx                         ; decrement the index
    jmp     BEG_INITIALIZE_DST          ; loop again
END_INITIALIZE_DST:                     ; end of loop
                                        ; all done!

    int     3   ; take a look at dst in the watch window

;-----------------------------------
; copy contents of src to dst
;-----------------------------------
    mov     esi, offset src             ; esi is the offset to the source bytes (0 terminated)
    mov     edi, offset dst             ; edi is the offset to the destination bytes (full of FF)
    mov     ecx, 0                      ; ecx is the starting index
BEG_COPY_STRING:
    mov     al, byte ptr [esi + ecx]    ; get the byte from the source bytes in the AL register
    mov     byte ptr [edi + ecx], al    ; put the byte in AL into the memory in the destination
    cmp     al, 0                       ; did we just copy the 0 at the send of the string?
    je      END_COPY_STRING             ; yes, so we can end our loop
    cmp     ecx, 63                     ; did we just copy the largest number of bytes we could?
    je      END_COPY_STRING             ; yes, so we can end our loop
    inc     ecx                         ; no, increment our index (ecx)
    jmp     BEG_COPY_STRING             ; and loop around again
END_COPY_STRING:                        ; end of loop
    mov     byte ptr [edi + 255], 0     ; always terminate the string with a 0
                                        ; all done!

    int     3   ; now what does dst look like?

    invoke  ExitProcess, 0        

MAIN endp
end MAIN
