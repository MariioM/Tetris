comprobarpunto:
;-------------------------------------------------------
    PUSH DE
    PUSH AF
    PUSH BC
    
    LD L, B
    LD A, (IY) 
    ADD L
    LD L, A 
    LD H, 0 ; HL = B
    ADD HL, HL
    ADD HL, HL
    ADD HL, HL
    ADD HL, HL
    ADD HL, HL; HL = HL *32
    LD A, (Middle) ;Guarda en A la posición del tetro respecto al centro
    ADD C
    LD C, A
    LD E, C
    LD D, 0 ; DE = C
    ADD HL, DE
    LD DE, $5800
    ADD HL, DE ; HL = Y*32 + X + $5800
    POP BC
    POP AF
    POP DE
    LD A, (HL)
    RET