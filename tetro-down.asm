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
    CALL TETRODELAY
    CALL TETRODEL
    CALL LASTPOSITION
    INC IY
    CALL TETROMOVE
    CALL TURNTETRO
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
    LD A, (Middle)
    CP 7
    JR Z, left_wall
    CP 8
    JR Z, left_wall
    CP 20
    JR Z, right_wall
    CP 21
    JR Z, right_wall
    POP BC
    DEC IY
    CALL DRAWTETRO
    CALL LASTPOSITION
    CALL RETURNIY
    RET
right_wall:
    DEC A
    LD (Middle), A
    CALL CHECKCOLISION
    CP 100
    JR Z, nexttetro
    JR NZ, downcontinue
    JR down
left_wall:
    INC A
    LD (Middle), A
    CALL CHECKCOLISION
    CP 100
    JR Z, nexttetro
    JR NZ, downcontinue

    JR down
goGameOver:
    POP BC
    LD A, 254
    RET
gamecontinue:
    RET
;----------------------------------------------------
    INCLUDE del-tetro.asm
    INCLUDE last-position.asm
    INCLUDE tetro-random.asm
    INCLUDE IYReturn.asm
    INCLUDE delay-tetro.asm