DELROW: ;Esta subrutina es igual que la del borde, solo que se comprueba si existe una fila en la que sea todo color.
ANCHOTAB EQU 14
LARGOTAB EQU 17
;-----------------------------------------------------------------------------------------------------------------------------
    LD A, 32
    SUB 2
    SUB ANCHOTAB
    SRL A
    LD C, A
    LD A, 0
    ADD (32 * 5 - 1)
    LD B, A
    LD HL, $5800
buc1:
    INC HL
    DJNZ buc1
    LD B, LARGOTAB
buc:
    PUSH BC
    LD B, C
marco_izquierdo:
    INC HL
    DJNZ marco_izquierdo
    PUSH BC
margen__izq:
    INC HL
    
    
    LD B, ANCHOTAB
    LD A, 0
    LD (FilaCompleta), A ;FilaCompleta será un contador. Si el contador llega a ser igual que el ancho, significará que se ha encontrado una fila completa de color
comienzo__ancho:
    INC HL
    LD A, (HL)
    CP 0
    JR NZ, color
    JR Z, reinicio_color
reinicio_color:
    LD A, 0 ;Si no se detecta color, inicializamos FilaCompleta a 0, por lo que ya nunca llegará a valer lo que vale anchotab
    LD (FilaCompleta), A 
color:
    LD A, (FilaCompleta)
    INC A ;Si se detecta color, incrementamos FilaCompleta
    LD (FilaCompleta), A 
    DJNZ comienzo__ancho

    LD A, (FilaCompleta)
    CP ANCHOTAB ;Comparamos con ANCHOTAB, lo que decidirá si se ha de borrar o no la fila
    JR Z, borrarlafila
    JR cotinuerowdel
borrarlafila:
    LD A, 0
    LD B, ANCHOTAB
    ADD B
    LD B, A ;Creamos un bucle a la inversa, que decremente HL una fila y ponga a negro dicha fila pixel a pixel.
decrementarhl:
    LD (HL), 0
    DEC HL
    DJNZ decrementarhl
cotinuerowdel:
margen__drcho:
    INC HL
    
    POP BC
    LD B, C
marco_derecho
    INC HL
    DJNZ marco_derecho
    POP BC
    DJNZ buc

    RET