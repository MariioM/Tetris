CREATEBOARD:                                 ;
    CALL CLEARSCR                         ;
ANCHO EQU 14                              ;
LARGO EQU 22                              ;
;------------------------------------------
    LD A, 32
    SUB 2
    SUB ANCHO
    SRL A
    LD C, A
    LD A, 0
    ADD (32 - 1)
    LD B, A
    LD HL, $5800
bucle1:
    INC HL
    DJNZ bucle1
    LD B, LARGO
bucle:
    PUSH BC
    LD B, C
marco_izq:
    INC HL
    DJNZ marco_izq 
    PUSH BC
margenizq:
    INC HL
    LD C, 7
    LD A, C
    ADD A
    ADD A
    ADD A
    LD (HL), A
    LD A, 0
    LD B, ANCHO
    ADD B
    LD B, A
comienzo_ancho:
    INC HL
    DJNZ comienzo_ancho
margendrcho:
    INC HL
    LD C,7
    LD A, C
    ADD A
    ADD A
    ADD A
    ld (HL), A
    
    POP BC
    LD B, C
marco_drcho
    INC HL
    DJNZ marco_drcho
    POP BC
    DJNZ bucle

    LD B, C
marco_izq_fila_ult:
    INC HL
    DJNZ marco_izq_fila_ult
fila_ultima:
    LD B, ANCHO + 2
bucle2:
    INC HL
    LD C,7
    LD A, C
    ADD A
    ADD A
    ADD A
    ld (HL), A
    DJNZ bucle2

    RET