    global main

    extern printf
    extern scanf

    section .text
    elem_size equ 4

        main:
            push ebp
            mov ebp, esp

            push dword n
            push dword msg1
            call scanf
            add esp, 8

           
            mov esi, array
            mov ebx, [n]
            lea edi, [esi + ebx*elem_size]
            cmp ebx, 0
            je finish
        loop_scan:
            push esi
            push dword msg1
            call scanf
            add esp, 8
            add esi, elem_size
            cmp esi, edi
            jl loop_scan

            mov esi, array
        loop_print:
            sub edi, elem_size
            push dword [edi]
            push dword msg2
            call printf
            add esp, 8
            cmp edi, esi
            jg loop_print

         finish:
            leave
            xor eax,eax
            ret

    section .data

        msg1 : db "%d", 0
        msg2 : db "%d хуй ", 0


    section .bss
        n      resd 1
        array  resd 10000
