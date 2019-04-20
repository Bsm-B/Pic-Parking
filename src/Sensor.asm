
_interruption:

;Sensor.c,5 :: 		void interruption(){
;Sensor.c,7 :: 		if (INTCON.RBIF){
	BTFSS      INTCON+0, 0
	GOTO       L_interruption0
;Sensor.c,8 :: 		if (PORTB.RB6) {
	BTFSS      PORTB+0, 6
	GOTO       L_interruption1
;Sensor.c,10 :: 		Open_Bar();
	CALL       _Open_Bar+0
;Sensor.c,13 :: 		}
L_interruption1:
;Sensor.c,14 :: 		if (PORTB.RB7){
	BTFSS      PORTB+0, 7
	GOTO       L_interruption2
;Sensor.c,16 :: 		Close_Bar();
	CALL       _Close_Bar+0
;Sensor.c,19 :: 		}
L_interruption2:
;Sensor.c,21 :: 		INTCON.RBIF  = 0; //REST FLAG
	BCF        INTCON+0, 0
;Sensor.c,22 :: 		}
L_interruption0:
;Sensor.c,25 :: 		}
L_end_interruption:
	RETURN
; end of _interruption

_Init_Sensor:

;Sensor.c,27 :: 		void Init_Sensor(){
;Sensor.c,28 :: 		TRISB = 0xFF; // TRISB INPUT
	MOVLW      255
	MOVWF      TRISB+0
;Sensor.c,29 :: 		INTCON = 0b10001000; // RB interruption
	MOVLW      136
	MOVWF      INTCON+0
;Sensor.c,30 :: 		OPTION_REG.INTEDG = 1;  // Falling Edge
	BSF        OPTION_REG+0, 6
;Sensor.c,33 :: 		}
L_end_Init_Sensor:
	RETURN
; end of _Init_Sensor
