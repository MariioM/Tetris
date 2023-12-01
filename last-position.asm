LASTPOSITION:
;---------------------------  
    LD B, 7
return:
    DEC IX
    DJNZ return

    RET