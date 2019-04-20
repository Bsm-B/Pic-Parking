
_main:

;Pic-Parking.c,9 :: 		void main() {
;Pic-Parking.c,10 :: 		Init_LCD();
	CALL       _Init_LCD+0
;Pic-Parking.c,11 :: 		Init_LM35();
	CALL       _Init_LM35+0
;Pic-Parking.c,12 :: 		Init_Sensor();
	CALL       _Init_Sensor+0
;Pic-Parking.c,13 :: 		Init_Control();
	CALL       _Init_Control+0
;Pic-Parking.c,14 :: 		do{
L_main0:
;Pic-Parking.c,15 :: 		Read_LM35( Temp);
	MOVLW      _Temp+0
	MOVWF      FARG_Read_LM35+0
	CALL       _Read_LM35+0
;Pic-Parking.c,16 :: 		LCD_Out(1,1,Temp);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Pic-Parking.c,17 :: 		Read_Places(Pt);
	MOVLW      _Pt+0
	MOVWF      FARG_Read_Places+0
	CALL       _Read_Places+0
;Pic-Parking.c,18 :: 		LCD_Out(2,1,Pt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Pt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Pic-Parking.c,19 :: 		}while(1);
	GOTO       L_main0
;Pic-Parking.c,20 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
