RANDOMTETRO:
    LD A, R
    AND 31
    CP 19
    JR C, continue
    SUB 19
continue:
    LD IX, T_O
    LD DE, ANCHOTETRO
    OR A
    JR Z, godraw
more:
    ADD IX, DE
    DEC A
    JR NZ, more

godraw:
    CALL DRAWTETRO

    RET
;-------------------------------
ANCHOTETRO EQU T_L1 - T_O
    INCLUDE draw-tetro.asm