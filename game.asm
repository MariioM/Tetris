MAINGAME:                                 ;
    CALL CLEARSCR                         ;                                        ;
;------------------------------------------
    CALL CREATEBOARD
gameflow:
    CALL RANDOMTETRO
    CALL TETRODOWN
    JR gameflow
    RET

fin: JR fin
;-----------------------------------------
    INCLUDE create-board.asm
    INCLUDE draw-tetro.asm
    INCLUDE tetro-down.asm
    INCLUDE position-coords.asm
    INCLUDE check-colision.asm