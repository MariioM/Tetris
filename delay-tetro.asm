TETRODELAY:
;------------------------------------------
    LD HL, $dddd
delayloop:
    DEC HL
    LD A, H
    OR 0
    JR NZ, delayloop
    RET
