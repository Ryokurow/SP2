.386
.model flat, stdcall, C
option casemap: none
 
include c:/masm32/include/windows.inc
include c:/masm32/include/user32.inc
include c:/masm32/include/kernel32.inc
includelib c:/masm32/lib/user32.lib
includelib c:/masm32/lib/kernel32.lib

include c:/masm32/include/msvcrt.inc
includelib c:/masm32/lib/msvcrt.lib

.data
A db 4
B db 8
Array db 1, 2, -3, 4, -5, 6 , 7, 8, 9, 10
n = $-Array
format1 db "����� = %d", 0
s db 0
buff db 32 dup(?)
szCaption db 'Summa A B'
.code
start:
mov ebx, 0
mov edx, 0
mov eax, 0
mov cl, 0
_cycle:
    cmp ebx, n
    je _close
    mov  al, [Array+ebx]
    jmp cmp1

 cmp1:
        cmp al, 0
        jg cmp2
	  jl contin
        je contin

 cmp2:
        cmp al, A
        jge cmp3
	  jl contin
        je L1

 cmp3:
        cmp al, B
        jle L1
        jge contin
    
 L1:
    add dl, al
    jmp contin

    
contin:
    inc ebx
    jmp _cycle
_close:

        invoke wsprintfA, addr buff, addr format1, edx, cl           
        invoke MessageBox, NULL,addr buff, offset szCaption, MB_OK  ; ����� � ���������� ����  ����������� ��������
end start

end start
