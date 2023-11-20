MAINGAME:                                 ;
    CALL CLEARSCR                         ;                                        ;
;------------------------------------------
    CALL CREATEBOARD
    LD A, Tetro_3D
    LD B, 3
    LD C, 10
    LD IX, T_I1
    CALL PRINTAT
fin: JR fin
;-----------------------------------------
    include create-board.asm