CREATEBOARD:                                 ;
    CALL CLEARSCR                         ;
ANCHO EQU 14                              ;
LARGO EQU 22                              ;
;------------------------------------------
    CALL Tetris_3D
    LD A, 32 ; Se carga en A el ancho de la pantalla
    SUB 2 ;Se le resta 2, que serán las columnas de los bordes
    SUB ANCHO ;Se le resta el ancho del tablero
    SRL A ;Se divide
    LD C, A
    LD A, 0
    ADD (32 - 1)
    LD B, A
    LD HL, $5800 ; Se guarda la dirección de memoria donde se guardan los atributos de la pantalla
bucle1:
    INC HL ; Se incrementa la dirección de memoria
    DJNZ bucle1 ; Se repite hasta que completa toda la fila vacía
    LD B, LARGO
bucle:
    PUSH BC
    LD B, C
marco_izq: ;Se deja espacio para el marco izquierdo
    INC HL
    DJNZ marco_izq 
    PUSH BC 
margenizq: ;Se pinta todo el borde izquierdo de blanco
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
    DJNZ comienzo_ancho ;Se deja el ancho del tablero sin pintar
margendrcho: ;Se pinta el borde derecho
    INC HL
    LD C,7
    LD A, C
    ADD A
    ADD A
    ADD A
    ld (HL), A
    
    POP BC
    LD B, C
marco_drcho: ;Se deja espacio después del marco derecho
    INC HL
    DJNZ marco_drcho
    POP BC
    DJNZ bucle

    LD B, C
marco_izq_fila_ult:;Se deja espacio para el marco izquierdo de la última fila
    INC HL
    DJNZ marco_izq_fila_ult
fila_ultima: ;Se reserva el espacio de la última fila
    LD B, ANCHO + 2
bucle2: ;Se pinta la última fila de blanco
    INC HL
    LD C,7
    LD A, C
    ADD A
    ADD A
    ADD A
    ld (HL), A
    DJNZ bucle2

    RET