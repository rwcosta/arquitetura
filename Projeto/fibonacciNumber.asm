extern printf, scanf
global main

section .bss
    num resd 1

section .data
    request db 'Digite o valor: ', 0H
    tp db '%d', 0H
    msg db 'O elemento %d da sequencia Fibonacci é: %d', 0AH, 0H

section .text
    fib:
        push ebp
        mov ebp, esp

        cmp ebx, 2
        ja exec

        ; Caso base
        inc eax
        jmp end

        exec:
            ; Calcula fib(n-1)
            dec ebx
            push ebx
            call fib

            ; Calcula fib(n-2)
            dec ebx
            push ebx
            call fib

            ; Seta ebx para o valor original para não influenciar nos cálculos de fib(n-2) nas chamadas anteriores
            add ebx, 2

        end:
            mov esp, ebp
            pop ebp
            ret 4

    main:
        push request
        call printf
        add esp, 4

        push num
        push tp
        call scanf
        add esp, 8

        mov eax, 0
        mov ebx, [num]

        cmp ebx, 0
        je exit

        push ebx
        call fib

        exit:
            push eax
            push ebx
            push msg
            call printf
            add esp, 12

            mov eax, 1
            mov ebx, 0
            int 80h
