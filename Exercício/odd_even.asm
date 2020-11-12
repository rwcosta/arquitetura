extern printf, scanf
global main

section .bss
    num resd 1

section .data
    request db 'Digite o valor: ', 0H
    tp db '%d'
    par db 0AH, 'É par', 0AH, 0H
    impar db 0AH, 'É ímpar', 0AH, 0H

section .text
    main:
        push request
        call printf
        add esp, 4

        push num
        push tp
        call scanf
        add esp, 8

        mov eax, [num]
        mov edx, 0
        mov ecx, 2
        
        div ecx
        cmp edx, 0
        je equals

        push impar
        call printf
        add esp, 8

        jmp end

        equals:
            push par
            call printf
            add esp, 8

        end:
            mov eax, 1
            mov ebx, 0
            int 80h
