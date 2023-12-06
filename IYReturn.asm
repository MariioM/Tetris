RETURNIY:
    LD A, (IY)
    CP 0
    JR Z, final
    DEC IY
    JR devuelvoIY


final:
    RET