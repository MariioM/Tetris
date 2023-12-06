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
    JR Z, randomend
more:
    ADD IX, DE
    DEC A
    JR NZ, more

randomend:
    RET
;-------------------------------
ANCHOTETRO EQU T_L1 - T_O