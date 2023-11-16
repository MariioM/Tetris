ENDSCREEN:
    CALL CLEARSCR
;--------------------------------------------------
;Imprime el GAME OVER
    LD A,2+$80 ; Se da formato de color al texto
    LD B,10    ; Coordenada de la fila
    LD C,12     ; Coordenada de la columna
    LD IX, GameOverText   ; Se añade el título
    CALL PRINTAT
    RET




;---------------------------------------------------------
GameOverText: db "GAME OVER", 0 ; Texto de fin de partida
ContinueText: db "Desea jugar de nuevo?", 0 ; Pregunta continue