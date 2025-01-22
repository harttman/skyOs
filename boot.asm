[BITS 16]
[ORG 0x7C00]

start:
    mov si, msg
    call print__string

main_loop:
    call get_key
    mov ah, 0x0E
    int 0x10
    jmp main_loop
    
print__string:
    lodsb
    or al, al
    jz return
    mov ah, 0x0E
    int 0x10
    jmp print__string

get_key:
    xor ah, ah
    int 0x16
    ret

return:
    ret

msg db 'Welcome to SKY-OS: $>', 0

times 510-($-$$) db 0
dw 0xAA55