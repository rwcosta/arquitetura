extern printf
global main

section .data
    counter dd 1000
    msg db 'Numeros: ', 0AH, 0H
    n db '%d', 0AH, 0H

section .text
    main:
        push msg
        call printf
        add esp, 4

        sequence:
            mov eax, [counter]
            mov edx, 0
            mov ecx, 11

            div ecx
            cmp edx, 5
            je equals

            jmp compare

            equals:
                push DWORD [counter]
                push n
                call printf
                add esp, 8

            compare:
                inc DWORD [counter]
                cmp DWORD [counter], 1999
                jbe sequence

        end:
            mov eax, 1
            mov ebx, 0
            int 80h
