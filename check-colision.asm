CHECKCOLISION:
;--------------------------------------------
    LD A, (IX)
    LD D, A
    INC IX
    LD A, (IXCounter)
    INC A
    LD (IXCounter), A
    LD A, (IX)
    LD E, A
    LD B, D
fil:
    PUSH BC
    LD B, E
cols:
    LD D, B
    INC IX
    LD A, (IXCounter)
    INC A
    LD (IXCounter), A
    LD A, (IX)
    LD (PosibleColor), A
    POP BC
    LD C, D
    CALL comprobarpunto
    CP 0
    JR Z, no_hay_color
puede_haber_color:
    LD A, (PosibleColor)
    CP 0
    JR Z, no_hay_color
hay_color:
    LD A, 100
    RET
no_hay_color:
    PUSH BC
    LD B, D
    DJNZ cols
    POP BC
    DJNZ fil

    RET
;----------------------------------------
    INCLUDE check-pixel.asm