;------------------------------------------------------------------------------------------------------------------
; Original author:      Dunc Sargent, dunc@tinkeri.com
; Original Repository:  https://github.com/Dunc-Sargent/Public-Learning
;
; For information about the Microsoft Macro Assembler see:
;    https://docs.microsoft.com/en-us/cpp/assembler/masm
;
; For samples see:
;    https://github.com/Microsoft/vcsamples
;
; If you don't already have a GitHub account, then get one now.
; Get used to using it right from the start.  Keep your lessons
; in it.  As you progress to the point of having a job interview,
; it will be better to show people what you did, rather than 
; telling them about it and waving your hands like a lunatic.
;------------------------------------------------------------------------------------------------------------------

.386                    ; Enables assembly of nonprivileged instructions for the 80386 processor.
                        ; See also: 
                        ;    https://docs.microsoft.com/en-us/cpp/assembler/masm/dot-386?view=vs-2017
.model flat, stdcall    ; initializes the program memory model
                        ; See also: 
                        ;    https://docs.microsoft.com/en-us/cpp/assembler/masm/dot-model?view=vs-2017
                        ;    https://en.wikipedia.org/wiki/Flat_memory_model
                        ;    https://en.wikipedia.org/wiki/X86_calling_conventions#stdcall

ExitProcess proto,      ; prototype the function 'ExitProcess' 
    dwExitCode:dword    ; which returns a DWORD named 'dwExitCode'
                        ; See also:    
                        ;    https://docs.microsoft.com/en-us/cpp/assembler/masm/proto?view=vs-2017

;------------------------------------------------------------------------------------------------------------------
.stack 4096             ; -- our stack segment --
                        ; will be 4K bytes
                        ; note that this is a decimal number
                        ; See also:    
                        ;    https://docs.microsoft.com/en-us/cpp/assembler/masm/dot-stack?view=vs-2017

;------------------------------------------------------------------------------------------------------------------
.data                   ; -- our data segment -- 
                        ; See also:    
                        ;     https://docs.microsoft.com/en-us/cpp/assembler/masm/dot-data?view=vs-2017

result word 0           ; a word into which we'll store the result
                        ; 'word' is a directive to the assembler
                        ; its initial value is 0
                        ; this is our 'result' variable

;------------------------------------------------------------------------------------------------------------------
.code                   ; -- our code segment -- 
                        ; See also:    
                        ;    https://docs.microsoft.com/en-us/cpp/assembler/masm/dot-code?view=vs-2017

MAIN proc               ; marks start and end of a procedure block called <label>. The statements in the 
                        ; block can be called with the CALL instruction or INVOKE directive

    int     3   ; -- break into the debugger (causes an exception)
                ; -- now step through this code watching the values of the AX register and the 
                ; -- 'result' variable

                                ; AX is a 16 but register (low word of EAX register)
    mov     ax, 0               ; initialize AX to be 00h, since it is junk on startup
                                ; 'MOV' is an instruction
    inc     ax                  ; increment AX, should then be 1
    add     ax, 14h             ; now add 14h to AX, AX should now be 15h
                                ; note that this is a hexadecimal number
    mov     word ptr result, ax ; move the value from AX into our 'result' variable

    int     3   ; -- now what is the value of the 'result' variable?

    invoke  ExitProcess, 0      ; exit this process with 32 bit value (dwExitCode) of 0

MAIN endp
end MAIN
