TETRODEL:
;------------------------------------------------------
    LD A, (IX)
    LD D, A
    INC IX
    LD A, (IXCounter)
    INC A
    LD (IXCounter), A
    LD A, (IX)
    LD E, A
    LD B, D
rowdel:
    PUSH BC
    LD B, E
columndel:
    LD D, B
    INC IX
    LD A, (IXCounter)
    INC A
    LD (IXCounter), A
    LD A, (IX)
    POP BC
    LD C, D
    CALL DELPIXEL
    PUSH BC
    LD B, D
    DJNZ columndel
    POP BC
    DJNZ rowdel
    
    RET
;-----------------------------------------
    INCLUDE del-pixel.asm