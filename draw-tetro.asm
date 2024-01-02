DRAWTETRO: 
;---------------------------------------------
    LD A, (IX)  ; Se carga el valor de la pieza
    LD D, A ; Se guarda en D
    INC IX 
    LD A, (IXCounter)
    INC A
    LD (IXCounter), A
    LD A, (IX)
    LD E, A
    LD B, D
drawfilas:
    PUSH BC ; Se guarda el valor de B
    LD B, E ; Se carga el número de columnas
drawcolumnas:
    LD D, B ; Se carga el número de columnas
    INC IX
    LD A, (IXCounter)
    INC A
    LD (IXCounter), A
    LD A, (IX)
    POP BC ; Se recupera el valor de B
    LD C, D ; Se carga la posición del pixel a dibujar
    CALL DRAWPIXEL ; Se dibuja el pixel 
    PUSH BC
    LD B, D ;Se decrementa el número de columnas restantes
    DJNZ drawcolumnas ;Comprueba que se hayan pintado todas las columnas
    POP BC ; Se recupera el valor de B
    DJNZ drawfilas ;Comprueba que se hayan pintado todas las filas

    RET
;------------------------------------------
    INCLUDE draw-pixel.asm