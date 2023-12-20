DRAWPIXEL:
    PUSH AF
    PUSH DE
    PUSH AF
    PUSH BC
;------------------------------------------------------
    LD A, B
    ADD (IY)
    LD B, A
    LD L, B
    LD H, 0 ; HL = B
    
    ADD HL, HL
    ADD HL, HL
    ADD HL, HL
    ADD HL, HL
    ADD HL, HL; HL = HL *32
    LD A, (Middle)
    ADD C
    LD C, A
    LD E, C
    LD D, 0 ; DE = C
    ADD HL, DE
    LD DE, $5800
    ADD HL, DE ; HL = Y*32 + X + $5800
    POP BC
    POP AF
    CP 0
    JR Z, tetroExistDraw
    LD (HL), A
tetroExistDraw:
    POP DE
    POP AF
    RET
;------------------------------------------------