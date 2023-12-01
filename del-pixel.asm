DELPIXEL:
;--------------------------------------------------
    PUSH AF
    PUSH DE
    PUSH AF
    PUSH BC
    
    LD L, B
    LD A, L
    ADD (IY)
    ADD 5 ;El tope supeior empieza en la fila 5
    LD L, A 
    LD H, 0 ; HL = B
    LD  (GameY), A
    ADD HL, HL
    ADD HL, HL
    ADD HL, HL
    ADD HL, HL
    ADD HL, HL; HL = HL *32
    LD A, C
    ADD 13
    LD C, A
    LD (GameX), A
    LD E, C
    LD D, 0 ; DE = C
    ADD HL, DE
    LD DE, $5800
    ADD HL, DE ; HL = Y*32 + X + $5800
    POP BC
    POP AF
    LD (HL), 0
    POP DE
    POP AF
    RET