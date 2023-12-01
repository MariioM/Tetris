DRAWTETRO: 
;---------------------------------------------
    LD A, (IX) 
    LD D, A
    INC IX
    LD A, (IX)
    LD E, A
    LD B, D
drawfilas:
    PUSH BC
    LD B, E
drawcolumnas:
    LD D, B
    INC IX
    LD A, (IX)
    POP BC
    LD C, D
    CALL DRAWPIXEL
    PUSH BC
    LD B, D
    DJNZ drawcolumnas
    POP BC
    DJNZ drawfilas

    RET
;------------------------------------------
    INCLUDE draw-pixel.asm