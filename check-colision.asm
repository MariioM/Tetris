CHECKCOLISION:
;Rutina que comprueba si un tetrominó colisiona con una pared o con otro tetrominó
;--------------------------------------------
    LD A, (IX)
    LD D, A
    INC IX
    LD A, (IXCounter)
    INC A
    LD (IXCounter), A
    LD A, (IX)
    LD E, A
    LD B, D
fil:
    PUSH BC
    LD B, E
cols:
    LD D, B
    INC IX
    LD A, (IXCounter)
    INC A
    LD (IXCounter), A
    LD A, (IX)
    LD (NewColor), A ;Guardamos el color del pixel que queremos pintar en ColorNuevo
    POP BC
    LD C, D
    CALL comprobarpunto ;A=color, B=fila, C=columna
    LD (OldColor), A ;comprobarpunto nos devuelve el color que había antes de pintar el pixel nuevo, por lo que lo almacenamos en ColorViejo
    LD A, B
    LD (GameXPosible), A 
    LD A, C
    LD (GameYPosible), A
    LD A, (OldColor)
    CP 0 ;Si dicho ColorViejo es negro, se podrá continuar comprobando los demás pixeles.
    JR Z, no_hay_color ;Si encontramos un color viejo existente, saltamos a ver los casos posibles
puede_haber_color:
    LD A, (NewColor)
    CP 0  ;En el caso de que haya color viejo, tenemos que observar si el color del pixel
    JR NZ, hay_color ;nuevo es negro o no, ya que en dicho caso no colisionarían colores.
    JR Z, no_hay_color
hay_color: ;Si existe un color viejo y nuevo, colisiona, por lo que habrá que ver si se trata de una pared o no.
    LD A, 100 
    RET
no_hay_color: ;En caso de no haber un color, comprueba otro pixel
    PUSH BC
    LD B, D
    DJNZ cols ;Comprueba todas las columnas
    POP BC
    DJNZ fil ;Comprueba todas las filas

    RET
;----------------------------------------
    INCLUDE check-pixel.asm