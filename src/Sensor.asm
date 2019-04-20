
_Init_Sensor:

;Sensor.c,6 :: 		void Init_Sensor(){
;Sensor.c,7 :: 		TRISB = 0xFF; // TRISB INPUT
	MOVLW      255
	MOVWF      TRISB+0
;Sensor.c,8 :: 		INTCON = 0b10001000; // RB interruption
	MOVLW      136
	MOVWF      INTCON+0
;Sensor.c,9 :: 		OPTION_REG.INTEDG = 1;  // Falling Edge
	BSF        OPTION_REG+0, 6
;Sensor.c,10 :: 		}
L_end_Init_Sensor:
	RETURN
; end of _Init_Sensor
