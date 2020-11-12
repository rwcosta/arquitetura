extern printf, scanf
global main

section .data
    a dd 0
    b dd 30
    c dd 20
    msg db 'Resultado: %d', 0AH, 0H

section .text
    main:
        mov eax, [b]
        add eax, [c]
        add eax, 100
        mov [a], eax

        push DWORD [a]
        push msg
        call printf
        add esp, 8

        mov eax, 1
        mov ebx, 0
        int 80h
