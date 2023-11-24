DRAWTETRO: 
;---------------------------------------------
    LD A, R
    AND 31
    CP 19
    JR C, continue
    SUB 19
continue:
    LD IX, T_O
    LD DE, ANCHOTETRO
    OR A
    JR Z, draw
more:
    ADD IX, DE
    DEC A
    JR NZ, more
draw:
    LD A, (IX) 
    LD D, A
    INC IX
    LD A, (IX)
    LD E, A
    LD B, D
filas:
    PUSH BC
    LD B, E
columnas:
    LD D, B
    INC IX
    LD A, (IX)
    POP BC
    LD C, D
    CALL DRAWPIXEL
    PUSH BC
    LD B, D
    DJNZ columnas
    POP BC
    DJNZ filas

    RET
;------------------------------------------
ANCHOTETRO EQU T_L1 - T_O
    INCLUDE draw-pixel.asm