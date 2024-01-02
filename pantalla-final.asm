ENDSCREEN:
    CALL CLEARSCR
;Muestra la pantalla de game over
;--------------------------------------------------
;Imprime el GAME OVER
    LD A,2+$80 ; Se da formato de color al texto
    LD B,10    ; Coordenada de la fila
    LD C,12     ; Coordenada de la columna
    LD IX, GameOverText   ; Se añade el título
    CALL PRINTAT

    LD A,3 ; Se da formato de color al texto
    LD B, 14    ; Coordenada de la fila
    LD C,4    ; Coordenada de la columna
    LD IX, ContinueText   ; Se añade el título
    CALL PRINTAT
    CALL TecladoFinal   ; Se lee el input del teclado hasta que se pulse S o N

;Rutina que guarda lo que pulsa el usuario
TecladoFinal:          ; Rutina para leer del teclado 'S' o 'N'
    LD BC,$7FFE         ; Escanear línea B,N,M,SYMB,Space
    IN A,(C)
    BIT 3,A
    JR Z,T_N_Final            ; Han pulsado N
    LD BC,$FDFE         ; Escanear línea G,F,D,S,A
    IN A,(C)
    BIT 1,A
    JR NZ,TecladoFinal       ; No han pulsado 'S'

T_S_final:    
    JR Soltar_Tecla_Final     ; Esperar q que suelten la tecla
    LD A, 104          ; Se guarda el valor 104 en A para nueva partida
    RET

T_N_Final:
    RET

Soltar_Tecla_Final:           ; Rutina de espera hasta que se suelta la tecla
    IN A,(C)            ; Leer del puerto que se ha definido en Lee_Tecla
    CP $FF              ; Comprobar que no hay tecla pulsada
    JR NZ,Soltar_Tecla_Final  ; esperar hasta que no haya tecla pulsada
    RET




;---------------------------------------------------------
GameOverText: db "GAME OVER", 0 ; Texto de fin de partida
ContinueText: db "Desea jugar de nuevo? (S/N)", 0 ; Pregunta continue