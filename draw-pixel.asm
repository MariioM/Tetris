DRAWPIXEL:
    PUSH AF
    PUSH DE ;Se guardan todos los registros
    PUSH AF
    PUSH BC
;------------------------------------------------------
    LD A, B ;Se carga la posicion en A
    ADD (IY) ;Se suma la posicion con la posicion del tetro
    LD B, A ; Se carga la posición actualizada en B
    LD L, B
    LD H, 0 ; HL = B
    
    ADD HL, HL
    ADD HL, HL
    ADD HL, HL
    ADD HL, HL
    ADD HL, HL; HL = HL *32
    LD A, (Middle) ;Se carga la posición del tetro en el eje X
    ADD C  ;
    LD C, A
    LD E, C
    LD D, 0 ; DE = C
    ADD HL, DE ;Se cargan los atributos
    LD DE, $5800
    ADD HL, DE ; HL = Y*32 + X + $5800
    POP BC
    POP AF
    CP 0
    JR Z, tetroExistDraw ;Si el valor es 0, no se dibuja
    LD (HL), A
tetroExistDraw:
    POP DE
    POP AF
    RET
;------------------------------------------------