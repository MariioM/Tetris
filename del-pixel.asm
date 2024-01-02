DELPIXEL:
;Borra un pixel
;--------------------------------------------------
    PUSH AF
    PUSH DE
    PUSH AF
    PUSH BC
    
    LD A, B ; Se carga la posición en A
    ADD (IY) ; Se suma la fila
    LD B, A ; Se guarda la posición en B
    LD L, B
    LD H, 0 ; HL = B
    
    ADD HL, HL
    ADD HL, HL
    ADD HL, HL
    ADD HL, HL
    ADD HL, HL; HL = HL *32
    LD A, (Middle) ; Se carga la posición en A
    ADD C
    LD C, A
    LD E, C
    LD D, 0 ; DE = C
    ADD HL, DE ;Se cargan los atributos del tetro
    LD DE, $5800
    ADD HL, DE ; HL = Y*32 + X + $5800
    POP BC
    POP AF
    CP 0
    JR Z, tetroExist ;Si el valor es 0, no se borrará nada
    LD (HL), 0
tetroExist:
    POP DE
    POP AF
    RET