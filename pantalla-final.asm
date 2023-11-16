;Imprime el GAME OVER
    LD A,1+$80 ; Se da formato de color al texto
    LD B,10    ; Coordenada de la fila
    LD C,10     ; Coordenada de la columna
    LD IX, GameOverText   ; Se añade el título
    RET




;---------------------------------------------------------
GameOverText: db "GAME OVER", 0 ; Texto de fin de partida
ContinueText: db "Desea jugar de nuevo?", 0 ; Pregunta continue