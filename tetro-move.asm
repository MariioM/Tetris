TETROMOVE:
;Rutina encargada de controlar el movimiento de la pieza
;--------------------------------------------------------
        
    LD BC,$BFFE       ; Escanear línea  H,J,K,L,ENTER
    IN A,(C)
    BIT 3,A
    JR Z, move_left    ; Han pulsado J -> Mover izquierda
    BIT 2,A
    JR Z, move_right  ; Han pulsado K -> Mover derecha
    BIT 0,A          
    JR Z, move_down ; Han pulsado ENTER -> Mover abajo
    JR no_tecla_move     ; No hay tecla pulsada

move_right:
    LD A, (Middle) 
    INC A
    LD (Middle), A
    JR SoltarTeclaMv     ; Esperar que suelten la tecla
    RET

move_left:
    LD A, (Middle) 
    DEC A
    LD (Middle), A
    JR SoltarTeclaMv     ; Esperar que suelten la tecla
    RET

move_down:
    INC IY ;Se baja la fila
    RET ;Se sale de la rutina

SoltarTeclaMv:           ; Rutina de espera hasta que se suelta la tecla
    IN A,(C)            ; Leer del puerto que se ha definido en Lee_Tecla
    CP $FF              ; Comprobar que no hay tecla pulsada
    JR NZ,SoltarTeclaMv  ; esperar hasta que no haya tecla pulsada
    RET

no_tecla_move:
    RET