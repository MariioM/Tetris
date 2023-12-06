LASTPOSITION:
;---------------------------  
    LD A, (IXCounter)
    LD B, A
return:
    DEC IX
    DJNZ return

    LD A, 0
    LD (IXCounter), A
    RET