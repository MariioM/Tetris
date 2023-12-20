TETRODELAY:
;------------------------------------------
    LD HL, 15000
delayloop:
    DEC HL
    LD A, H
    OR 0
    JR NZ, delayloop
    RET
