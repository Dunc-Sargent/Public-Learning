;------------------------------------------------------------------------------------------------------------------
; Original author:		Dunc Sargent, dunc@tinkeri.com
; Original Repository:	https://github.com/Dunc-Sargent/Public-Learning
;
; In this project we are using the MASM32 SDK.  You can downloan the latest installer from their website:
;    http://masm32.com
;------------------------------------------------------------------------------------------------------------------

include \masm32\include\masm32rt.inc   ; MASM32

.386
;.model flat, stdcall			        ; not used if using MASM32

ExitProcess proto, dwExitCode:dword			

;------------------------------------------------------------------------------------------------------------------
.stack 4096						        ; -- our stack segment --

;------------------------------------------------------------------------------------------------------------------
.data							        ; -- our data segment -- 

;------------------------------------------------------------------------------------------------------------------
.code							        ; -- our code segment -- 

MAIN proc
    
    print "Hello World!", 0Ah, 0Dh, 0Ah, 0Dh           ; MASM32

    mov     ebx, 'a'            ; we're going to start at a and print to 
.Repeat
	push    ebx                 ; push the character to print on the stack
	print   esp, ' '                                    ; MASM32
	inc     ebx
	pop     eax
.Until      ebx > "z"

    MsgBox  0, "Masm32 is great", "Hello World:", MB_OK ; MASM32
    exit                                                ; MASM32

MAIN endp
end MAIN
