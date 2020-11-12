extern printf, scanf
global main

section .bss
    num1 resd 1
    num2 resd 1

section .data
    request db 'Digite o valor: ', 0H
    tp db '%d[^\n]'
    msg db 0AH, 'O resultado é: %d', 0AH, 0AH

section .text
    main:
        push request
        call printf
        add esp, 4

        push num1
        push tp
        call scanf
        add esp, 8

        push request
        call printf
        add esp, 4

        push num2
        push tp
        call scanf
        add esp, 8

        mov eax, [num1]
        cmp eax, [num2]
        jae bigger

        push DWORD [num2]
        push msg
        call printf
        add esp, 8

        jmp end

        bigger:
            push eax
            push msg
            call printf
            add esp, 8

        end:
            mov eax, 1
            mov ebx, 0
            int 80h
