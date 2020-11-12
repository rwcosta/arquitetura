extern scanf, printf
global main

section .bss
    value resd 1

section .data
    counter dd 1
    message db 'Resultado: %d', 0AH, 0H
    quest db 'Digite o valor: ', 0H
    tp db '%d', 0

section .text
    main:
        mov eax, 0
        
        push quest
        call printf
        add esp, 4

        push value
        push tp
        call scanf
        add esp, 8

        mov edx, [value]
    
        sum:
            inc DWORD [counter]
            add eax, [counter]
            cmp [counter], edx
            jb sum

        end:
            push eax
            push message
            call printf
            add esp, 8

            mov ebx, 0
            mov eax, 1
            int 80h
