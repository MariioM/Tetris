MAINGAME:                                 ;
    CALL CLEARSCR                         ;                                        ;
;------------------------------------------
    CALL CREATEBOARD
    CALL DRAWTETRO
fin: JR fin
;-----------------------------------------
    INCLUDE create-board.asm
    INCLUDE draw-tetro.asm