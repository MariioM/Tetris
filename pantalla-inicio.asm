
STARTSCREEN:                                   ;
    CALL CLEARSCR                              ;
    CALL startInit                             ;
;-----------------------------------------------
startInit:
;Imprimir título
    LD A,3+$80 ; Se da formato de color al texto
    LD B,3     ; Coordenada de la fila
    LD C,8     ; Coordenada de la columna
    LD IX,StartTitle    ; Se añade el título
    CALL PRINTAT    ; Se llama a la rutina que imprime el título

;Imprimir pregunta

    LD A,4  ; Se da formato de color al texto
    LD B,14 ; Coordenada de la fila
    LD C,2  ; Coordenada de la columna
    LD IX,StartQuestion ; Se añade la pregunta
    CALL PRINTAT ; Se llama a la rutina para imprimir la pregunta

    LD B,14 ; Se pone el cursor en las coordenadas 14(fila)
    LD C,28 ; y 28(Columna)
    CALL Coor_Atrib ; Llamamos a la rutina encargada de devolver la dirección del atributo
    LD A,4+$80  ; Se le da el formato
    LD (HL),A   ; Se imprime el cursor

    CALL TecladoInicio    ; Se lee el input del teclado hasta que se pulse S o N


;Función para guardar coordenadas
Coor_Atrib:
    PUSH AF ; Se guarda el registro AF en el stack
    LD H,b  ; Los bits 4,5 de B deben ser los bits 0,1 de H
    SRL H : SRL H : SRL H
    LD A,B  ; Los bits 0,1,2 de B deben ser los bits 5,6,7 de L
    SLA A : SLA A : SLA A : SLA A : SLA a
    OR c  ; Y C son los bits 0-4 de L
    LD L,A
    LD BC, $5800
    ADD HL,BC ; Se le suma la dirección de memoria del comienzo de los atributos
    POP AF ; Se devuelve el registro AF del stack
    RET

;Rutina que guarda lo que pulsa el usuario
TecladoInicio:          ; Rutina para leer del teclado 'S' o 'N'
    LD BC,$7FFE         ; Escanear línea B,N,M,SYMB,Space
    IN A,(C)
    BIT 3,A
    JR Z,T_N            ; Han pulsado N
    LD BC,$FDFE         ; Escanear línea G,F,D,S,A
    IN A,(C)
    BIT 1,A
    JR NZ,TecladoInicio       ; No han pulsado 'S'

T_S:    
    JR Soltar_Tecla     ; Esperar q que suelten la tecla
    RET

T_N:
    RET

Soltar_Tecla:           ; Rutina de espera hasta que se suelta la tecla
    IN A,(C)            ; Leer del puerto que se ha definido en Lee_Tecla
    CP $FF              ; Comprobar que no hay tecla pulsada
    JR NZ,Soltar_Tecla  ; esperar hasta que no haya tecla pulsada
    RET


; Carga de ficheros y "variables"
StartTitle: db "WELCOME TO TETRIS", 0 ;Título del tetris
StartQuestion: db "Iniciar una partida? (S/N)", 0 ;Pregunta Inicio
Respuesta: db "Has contestado: ",0  ; Mensaje con la respuesta


