TETROMINOS:                                                       ;
;Rutina que contiene la forma de los tetrominos, y sus rotaciones ;
;-----------------------------------------------------------------;
;Tetromino O
T_O: DB 2, 2, 6*8, 6*8, 6*8, 6*8, 0, 0: DW T_O, T_O
;Tetromino L
T_L1: DB 3, 2, 4*8, 0, 4*8, 0, 4*8, 4*8: DW T_L2, T_L3
T_L2: DB 2, 3, 0, 0, 4*8, 4*8, 4*8, 4*8: DW T_L4, T_L1
T_L3: DB 2, 3, 4*8, 4*8, 4*8, 4*8, 0, 0: DW T_L1, T_L4
T_L4: DB 3, 2, 4*8, 4*8, 0, 4*8, 0, 4*8: DW T_L3, T_L2
;Tetromino J
T_J1: DB 3, 2, 0, 2*8, 0, 2*8, 2*8, 2*8: DW T_J2, T_J3
T_J2: DB 2, 3, 2*8, 2*8, 2*8, 0, 0, 2*8: DW T_J4, T_J1
T_J3: DB 2, 3, 2*8, 0, 0, 2*8, 2*8, 2*8: DW T_J1, T_J4
T_J4: DB 3, 2, 2*8, 2*8, 2*8, 0, 2*8, 0: DW T_J3, T_J2
;Tetromino T
T_T1: DB 2, 3, 5*8, 5*8, 5*8, 0, 5*8, 0 : DW T_T2, T_T3
T_T2: DB 3, 2, 5*8, 0, 5*8, 5*8, 5*8, 0 : DW T_T4, T_T1
T_T3: DB 3, 2, 0, 5*8, 5*8, 5*8, 0, 5*8 : DW T_T1, T_T4
T_T4: DB 2, 3, 0, 5*8, 0, 5*8, 5*8, 5*8 : DW T_T3, T_T2
;Tetromino I
T_I1: DB 4, 1, 6*8, 6*8, 6*8, 6*8, 0, 0 : DW T_I2, T_I2
T_I2: DB 1, 4, 6*8, 6*8, 6*8, 6*8, 0, 0 : DW T_I1, T_I1
;Tetromino Z
T_Z1: DB 2, 3, 7*8, 7*8, 0, 0, 7*8, 7*8 : DW T_Z2, T_Z2
T_Z2: DB 3, 2, 0, 7*8, 7*8, 7*8, 7*8, 0 : DW T_Z1, T_Z1
;Tetromino S
T_S1: DB 2, 3, 0, 3*8, 3*8, 3*8, 3*8, 0 : DW T_S2, T_S2
T_S2: DB 3, 2, 3*8, 0, 3*8, 3*8, 0, 3*8 : DW T_S1, T_S1

row_coords: DB 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22