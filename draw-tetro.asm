DRAW:
;---------------------------------------------
    LD IX, T_O
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
    INCLUDE draw-pixel.asm