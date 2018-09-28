;------------------------------------------------------------------------------------------------------------------
; Original author:      Dunc Sargent, dunc@tinkeri.com
; Original Repository:  https://github.com/Dunc-Sargent/Public-Learning
;
; In this project we are using the IRVING SDK. You can download the latest installer from their website:
; http://kipirvine.com/asm/gettingStartedVS2017/index.htm
;------------------------------------------------------------------------------------------------------------------

include     ..\Irvine\irvine32.inc  ; IRVINE
includelib  ..\Irvine\irvine32.lib  ; IRVINE

.386
;.model flat, stdcall    ; not used if using IRVINE

ExitProcess proto, dwExitCode:dword 

;------------------------------------------------------------------------------------------------------------------
.stack 4096             ; -- our stack segment --

;------------------------------------------------------------------------------------------------------------------
.data                   ; -- our data segment -- 

;------------------------------------------------------------------------------------------------------------------
.code                   ; -- our code segment -- 

MAIN proc
 
 invoke WaitMsg
 invoke ExitProcess, 0 

MAIN endp
end MAIN
