TETRODOWN: 
;Rutina encargada de bajar el tetromino.
;Contiene también las funcionalidades de mover/rotar el tetromino y de comprobar si hay colisión.
;--------------------------------------------------------------------------------------------------
    LD IY, row_coords ;Se carga la direccion de memoria de la fila
    CALL CHECKCOLISION ;Se llama a la funcion que revisa si hay colision
    CP 100 ;Se comprueba la condición de derrota
    JR Z, goGameOver ;Si se va a la funcion de GameOver
    CALL LASTPOSITION ;Si no, se llama a la funcion que devuelve IX

down:
    PUSH BC ;Se guarda el valor de BC
    CALL DRAWTETRO ;Se llama a la funcion que dibuja el tetromino
    CALL LASTPOSITION ;Se llama a la funcion que devuelve IX
    CALL TETRODELAY ;Se llama a la funcion que hace el tiempo de espera
    CALL TETRODEL ;Se llama a la funcion que borra el tetromino
    CALL LASTPOSITION ;Se llama a la funcion que devuelve IX
    INC IY ;Se incrementa la fila
    CALL TETROMOVE ;Se llama a la funcion que comprueba el movimiento del tetromino
    CALL TURNTETRO ;Se llama a la funcion que comprueba el giro el tetromino
    CALL CHECKCOLISION ;Se llama a la funcion que comprueba si hay colision
    CP 100 ;Se comprueban las colisiones
    JR Z, nexttetro ;Si hay colisión, se va a la siguiente pieza
    JR NZ, downcontinue ;Si no, se continua bajando

downcontinue:
    CALL DELROW ;Se llama a la funcion que comprueba si hay fila completa
    CALL LASTPOSITION ;Se llama a la funcion que devuelve IX
    POP BC ;Se recupera el valor de BC
    JR down ;Continua la función de bajar pieza
nexttetro:
    CALL LASTPOSITION ;Se llama a la funcion que devuelve IX
    LD A, (Middle) ;Se carga el valor de la variable Middle, que contiene la posición del tetro respecto al centro
    CP 7
    JR Z, left_wall
    CP 8
    JR Z, left_wall ;Se comprueban las colisiones con las paredes izquierda y derecha
    CP 20
    JR Z, right_wall
    CP 21
    JR Z, right_wall
    POP BC ;Se recupera el valor de BC
    DEC IY ;Se decrementa la fila
    CALL DRAWTETRO ;Se llama a la funcion que dibuja el tetromino
    CALL LASTPOSITION ;Se llama a la funcion que devuelve IX
    CALL RETURNIY ;Se llama a la funcion que devuelve IY
    RET ;Se sale de la rutina hacia el game (Tetro posicionado)
right_wall:
    DEC A ;Si se colisiona con la pared derecha, mueve el tetro hacia la izquierda
    LD (Middle), A ;Realiza el cambio de posición
    CALL CHECKCOLISION ;Se comprueba si hay colisisión	
    CP 100 
    JR Z, nexttetro ;Si hay colisión, se va a la siguiente pieza
    JR NZ, downcontinue ;Si no, se continua bajando
    JR down
left_wall:
    INC A ;Si se colisiona con la pared izquierda, mueve el tetro hacia la derecha
    LD (Middle), A ;Realiza el cambio de posición
    CALL CHECKCOLISION ;Se comprueba si hay colisisión
    CP 100
    JR Z, nexttetro ;Si hay colisión, se va a la siguiente pieza
    JR NZ, downcontinue ;Si no, se continua bajando

    JR down
goGameOver:
    POP BC ;Se recupera el valor de BC
    LD A, 254 ;Se carga el valor de 254 en A para comprobar la derrota
    RET ;Vueleve al main
gamecontinue:
    RET
;----------------------------------------------------
    INCLUDE del-tetro.asm
    INCLUDE last-position.asm
    INCLUDE tetro-random.asm
    INCLUDE IYReturn.asm
    INCLUDE delay-tetro.asm