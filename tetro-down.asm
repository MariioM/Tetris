TETRODOWN: 
;-----------------------------------------
    LD IY, row_coords
    CALL CHECKCOLISION
    CP 100
    JR Z, goGameOver
    CALL LASTPOSITION

down:
    PUSH BC
    CALL DRAWTETRO
    CALL LASTPOSITION
    CALL TETRODEL
    CALL LASTPOSITION
    INC IY
    CALL CHECKCOLISION
    CP 100
    JR Z, nexttetro
    JR NZ, downcontinue
downcontinue:
    CALL LASTPOSITION
    POP BC
    JR down
nexttetro:
    CALL LASTPOSITION
    POP BC
    DEC IY
    CALL DRAWTETRO
    CALL LASTPOSITION
    CALL RETURNIY
    RET
goGameOver:
    POP BC
    LD A, 777
    RET
gamecontinue:
    RET
;----------------------------------------------------
    INCLUDE del-tetro.asm
    INCLUDE last-position.asm
    INCLUDE tetro-random.asm
    INCLUDE IYReturn.asm