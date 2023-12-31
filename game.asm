MAINGAME:                                           ;
    CALL CLEARSCR  ;Limpia la pantalla              ;
;Rutina encargada de manejar el flujo del juego     ;
;----------------------------------------------------
    CALL CREATEBOARD ; Crea el tablero
gameflow:
    CALL RANDOMTETRO ; Geneta un tetromino aleatorio
    LD A, 14
    LD (Middle), A
    CALL TETRODOWN ; Llama a la funcion que dibuja y mueve el tetromino hacia abajo
    CP 254 ;Comprueba el gaemover
    JR NZ, gameflow ;Si no es gameover, sigue el juego
    RET ; Si es gameover, sale del juego

fin: JR fin
;-----------------------------------------
    INCLUDE create-board.asm
    INCLUDE draw-tetro.asm
    INCLUDE tetro-down.asm
    INCLUDE position-coords.asm
    INCLUDE check-colision.asm
    INCLUDE turn-tetro.asm
    INCLUDE tetro-move.asm
    INCLUDE del-row.asm
    