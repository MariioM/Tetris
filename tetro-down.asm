TETRODOWN: 
;-----------------------------------------
    LD IY, row_coords
    LD B, 22
down:
    PUSH BC
    CALL DRAWTETRO
    CALL LASTPOSITION
    INC IY
    CP 100
    JR Z, downend
    DEC IY
    CALL TETRODEL
    INC IY
    CALL LASTPOSITION
    POP BC
    DJNZ down
downend: 
    POP BC
    RET
;----------------------------------------------------
    INCLUDE del-tetro.asm
    INCLUDE last-position.asm
    INCLUDE tetro-random.asm