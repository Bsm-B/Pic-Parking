
_main:

;Pic-Parking.c,8 :: 		void main() {
;Pic-Parking.c,9 :: 		Init_LCD();
	CALL       _Init_LCD+0
;Pic-Parking.c,10 :: 		Init_LM35();
	CALL       _Init_LM35+0
;Pic-Parking.c,11 :: 		do{
L_main0:
;Pic-Parking.c,12 :: 		Read_LM35( Temp);
	MOVLW      _Temp+0
	MOVWF      FARG_Read_LM35+0
	CALL       _Read_LM35+0
;Pic-Parking.c,13 :: 		LCD_Out(1,1,Temp);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Pic-Parking.c,14 :: 		}while(1);
	GOTO       L_main0
;Pic-Parking.c,17 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
