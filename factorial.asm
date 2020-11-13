extern printf, scanf
global main

section .bss
    num resd 1

section .data
    request db 'Digite o valor: ', 0H
    tp db '%d', 0H
    msg db 'Resultado: %d', 0AH, 0H

section .text
    factorial:
        push ebp
        mov ebp, esp

        cmp ebx, 1
        je end

        mul ebx
        dec ebx
        push ebx
        call factorial

        end:
            mov esp, ebp
            pop ebp
            ret 4

    main:
        mov eax, 1

        push request
        call printf
        add esp, 4

        push num
        push tp
        call scanf
        add esp, 8

        mov ebx, [num]
        push ebx
        call factorial

        push eax
        push msg
        call printf
        add esp, 8

        exit:
            mov eax, 1
            mov ebx, 0
            int 80h
