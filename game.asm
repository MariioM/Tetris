MAINGAME:                                 ;
    CALL CLEARSCR                         ;                                        ;
;------------------------------------------
    CALL CREATEBOARD
    LD A, 3
    LD B, 3
    LD C, 10
    LD IX, T_L2
    CALL PRINTAT
fin: JR fin
;-----------------------------------------
    include create-board.asm