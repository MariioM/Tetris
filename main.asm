    DEVICE ZXSPECTRUM48 ;Especificacion para el emulador                    ;
    ORG $8000 ;Programa empieza en $8000                                    ;
    LD SP, 0 ;Carga del stack en 0                                          ;
;Rutina principal del juego encargada de llamar a las rutinas principales   ;                    
;---------------------------------------------------------------------------;
gameStart:
    CALL STARTSCREEN ;Se llama a la pantalla de inicio
gameInit:
    CALL MAINGAME ;Se llama al juego
gameEnd:
    CALL ENDSCREEN ;Se llama a la pantalla final
    CP 104 ;Se comprueba si se quiere jugar de nuevo
    JR NZ , gameStart

mainEnd: JR mainEnd ;Se queda en un bucle infinito
;-------------------------------------------------------------------
    INCLUDE pantalla-final.asm
    INCLUDE game.asm
    INCLUDE pantalla-inicio.asm
    INCLUDE printat.asm ;Se "importa" la rutina printat
    INCLUDE fichas.asm
    INCLUDE Tetris_3D.asm