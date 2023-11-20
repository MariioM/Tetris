MAINGAME:
    CALL CLEARSCR
ANCHO EQU 11
LARGO EQU 15
;--------------------------------
    LD A, 32
    SUB 2
    SUB ANCHO
    SRL A
    LD C, A
    LD A, 0
    ADD (32 * 5)
    ADD C
    LD HL, $5800
    LD B, LARGO
bucle:
    PUSH BC
    LD B, A
marco_izq:
    INC HL
    DJNZ marco_izq 
    PUSH BC
margenizq:
    INC HL
    LD C,1
    LD A, C
    ADD A
    ADD A
    ADD A
    ld (hl), a  					; Transfer the color to the video memory position
     
    LD A, 0
    LD B, ANCHO
    ADD B
    LD B, A
comienzo_ancho:
    INC HL
    DJNZ comienzo_ancho
    JR margendrcho
margendrcho:
    INC HL
    LD C,1
    LD A, C
    ADD A
    ADD A
    ADD A
    ld (hl), a
    
    POP BC
    LD B, C
marco_drcho
    INC HL
    DJNZ marco_drcho
    POP BC
    DJNZ bucle

fin: JR fin
