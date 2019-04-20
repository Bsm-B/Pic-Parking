
_Init_LCD:

;LCD.c,3 :: 		void Init_LCD(){
;LCD.c,5 :: 		Lcd_Init();                     // Initialize LCD
	CALL       _Lcd_Init+0
;LCD.c,6 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,7 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);         //  Disable cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,9 :: 		}
L_end_Init_LCD:
	RETURN
; end of _Init_LCD
