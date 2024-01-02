RANDOMTETRO:
;Rutina encargada de cargar un tetrominó aleatorio 
;-------------------------------------------------

    LD A, R ;Se carga en A un número aleatorio entre 0 y 255
    AND 31 ;Se hace un AND con 31 para que el número esté entre 0 y 31
    CP 19 ;Se compara con 19, si es menor
    JR C, continue ;Si es menor que 19, se carga el tetrominó
    SUB 19 ;Si es mayor, se le resta 19
continue:
    LD IX, T_O ;Se carga el tetrominó O
    LD DE, ANCHOTETRO ;Se guarda el ancho de palabra del tetrominó
    OR A ;Si es 0, se termina la rutina y se pinta el tetrominó O
    JR Z, randomend 
more:
    ADD IX, DE ;Si no lo es, se pasa al siguiente tetrominó
    DEC A
    JR NZ, more ;Se repite hasta que se llegue a la dirección de memoria del tretrominó a pintar

randomend:
    RET
;-------------------------------
ANCHOTETRO EQU T_L1 - T_O