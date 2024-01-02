TETRODELAY:
;Establece un tiempo de espera para los movimientos de las piezas
;------------------------------------------
    LD HL, 15000 ; Se impone un tiempo de espera entre movimiento y movimiento
delayloop:
    DEC HL
    LD A, H
    OR 0 ;Se va decerementando el registro HL hasta que sea 0
    JR NZ, delayloop
    RET ;Cuando pase el tiempo, se sigue el programa
