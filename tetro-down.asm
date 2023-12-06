TETRODOWN: 
;-----------------------------------------
    LD IY, row_coords
    CALL CHECKCOLISION
    CALL LASTPOSITION
    CP 100
    JR Z, goGameOver
    LD A, 0
    LD (IXCounter), A

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
    LD A, 0
    LD (IXCounter), A
    JR NZ, downcontinue
downcontinue:
    CALL LASTPOSITION
    POP BC
    JR down
nexttetro:
    LD A, (IXCounter)
devuelvoix:
    CP 0
    JR Z, correct
    DEC A
    DEC IX
    JR devuelvoix
correct:
    POP BC
    DEC IY

    CALL DRAWTETRO
    CALL devolverIX
    CALL devuelvoIY
    RET
goGameOver:
    POP BC
    RET
gamecontinue:
    RET
;----------------------------------------------------
    INCLUDE del-tetro.asm
    INCLUDE last-position.asm
    INCLUDE tetro-random.asm