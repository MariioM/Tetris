MAINGAME:                                 ;
    CALL CLEARSCR                         ;                                        ;
;------------------------------------------
    CALL CREATEBOARD
    CALL RANDOMTETRO
    CALL DRAWTETRO
    CALL TETRODOWN

fin: JR fin
;-----------------------------------------
    INCLUDE create-board.asm
    INCLUDE draw-tetro.asm
    INCLUDE tetro-down.asm
    INCLUDE position-coords.asm