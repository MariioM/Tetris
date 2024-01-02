TETRODEL:
;Borra la pieza actual del tablero. Para ello, llama a DELPIXEL con las coordenadas de cada uno de los píxeles que forman la pieza.
;------------------------------------------------------
    LD A, (IX) ; Se carga en A el tetrominó actual
    LD D, A ; Se guarda en D el tetrominó actual
    INC IX
    LD A, (IXCounter)
    INC A
    LD (IXCounter), A
    LD A, (IX)
    LD E, A ;Se guardan las columnas en E
    LD B, D ;Se guardan las filas en B
rowdel:
    PUSH BC ;Se guarda en la pila el valor de B
    LD B, E ;Se cargan las columnas en B
columndel:
    LD D, B
    INC IX ;Se incrementa IX para que apunte a la siguiente posición
    LD A, (IXCounter) 
    INC A
    LD (IXCounter), A
    LD A, (IX)
    POP BC
    LD C, D ;Se carga la posición del pixel a borrar en C
    CALL DELPIXEL ;Se borra el pixel en las coordenadas indicadas
    PUSH BC
    LD B, D
    DJNZ columndel ;Se repite el bucle hasta que se borren todas las columnas
    POP BC ;Se recupera el valor de B
    DJNZ rowdel ;Se repite el bucle hasta que se borren todas las filas
    
    RET
;-----------------------------------------
    INCLUDE del-pixel.asm