LASTPOSITION:                                                   ;
;Rutina encargada de controlar los cambios sobre los tetrominos ;
;---------------------------------------------------------------;
    LD A, (IXCounter) ;Se carga en A el valor de IXCounter
    LD B, A
return:
    DEC IX
    DJNZ return

    LD A, 0
    LD (IXCounter), A
    RET