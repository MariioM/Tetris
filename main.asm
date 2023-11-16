    DEVICE ZXSPECTRUM48 ;Especificación para el emulador
    ORG $8000 ;Programa empieza en $8000
    LD SP, 0 ;Carga del stack en 0
;-------------------------------------------------------------------
gameStart:
    CALL STARTSCREEN
gameEnd:
    CALL ENDSCREEN

mainEnd: JR mainEnd
;-------------------------------------------------------------------
    INCLUDE pantalla-final.asm
    INCLUDE pantalla-inicio.asm
    INCLUDE printat.asm ;Se "importa" la rutina printat
    