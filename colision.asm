COMPRUEBO:
;----------------------------------------------------------------------------------------
    LD A, (IX)
    ADD (IY)
    LD D, A
    INC IX
    LD A, (IX)
    LD E, A
    LD B, D ;B = fila 4
fil:
    PUSH BC ; Guardo B en la pila
    LD B, E ; B = columna 2
cols:
    LD D, B ; Guardo en D la columna 2
    INC IX ; Incremento IX, y ahora apunta al primer color de la columna 2, fila 4
    LD A, (IX) ; Guardo en A el color
    POP BC ;Vuelvo a tener la fila 4
    LD C, D; Guardo en C la columna 2
    CALL comprobarpunto ; Compruebo el punto
    CP 0
    JR Z, no_hay_color
hay_color:
    LD A, 100
    RET
no_hay_color:
    PUSH BC ; Guardo la fila 4 y la columna 2
    LD B, D
    DJNZ cols
    POP BC

    DEC IX
    LD B, E
devolver_:
    DEC IX
    DJNZ devolver_

    RET
;--------------------------------------------------
    INCLUDE check-pixel.asm