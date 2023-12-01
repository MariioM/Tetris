TETRODOWN: 
;-----------------------------------------
    LD IY, row_coords
    LD B, 20
RUTINA_BAJAR:
    PUSH BC
    CALL DRAWTETRO
    CALL LASTPOSITION
    INC IY
    CP 100
    JR Z, SE_ACABO
    DEC IY
    CALL TETRODEL
    INC IY
    CALL LASTPOSITION
    POP BC
    DJNZ RUTINA_BAJAR
SE_ACABO: 
    POP BC
    RET
;----------------------------------------------------
    INCLUDE del-tetro.asm
    INCLUDE last-position.asm