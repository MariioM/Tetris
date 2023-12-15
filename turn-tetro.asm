TURNTETRO:
;--------------------------------------------------------------------
        
    LD BC,$FBFE        ; Escanear línea  T,R,E,W,Q
    IN A,(C)
    BIT 0,A
    JR Z, turn_left    ; Han pulsado Q -> Girar izquierda
    BIT 1,A
    JR Z, turn_right  ; Han pulsado W -> Girar derecha
    JR no_tecla         ; No hay tecla pulsada

turn_right:
    LD L, (IX + 10)
    LD H, (IX + 11)  
    LD IX, HL  
    JR SoltarTecla     ; Esperar q que suelten la tecla
    
turn_left:
    LD L, (IX + 8)
    LD H, (IX + 9) 
    LD IX, HL
    JR SoltarTecla     ; Esperar q que suelten la tecla
    RET


SoltarTecla:           ; Rutina de espera hasta que se suelta la tecla
    IN A,(C)            ; Leer del puerto que se ha definido en Lee_Tecla
    CP $FF              ; Comprobar que no hay tecla pulsada
    JR NZ,SoltarTecla  ; esperar hasta que no haya tecla pulsada
    RET

no_tecla:
    RET

