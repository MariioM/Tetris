RETURNIY:                                         ;
;Rutina encargada de guardar las filas restantes  ;
;-------------------------------------------------;
    LD A, (IY) ; Se guarda en A la direccuón de memoria a la que apunta IY
    CP 0 ; Se compara con 0
    JR Z, final ; Si es 0, se sale del programa
    DEC IY ; Si no, se decrementa IY
    JR RETURNIY ;Hasta que sea 0


final:
    RET