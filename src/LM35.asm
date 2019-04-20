
_Init_LM35:

;LM35.c,3 :: 		void Init_LM35(){
;LM35.c,4 :: 		TRISA = 0xFF;
	MOVLW      255
	MOVWF      TRISA+0
;LM35.c,5 :: 		ADCON1 = 0x0E;   //ONLY A0;
	MOVLW      14
	MOVWF      ADCON1+0
;LM35.c,6 :: 		}
L_end_Init_LM35:
	RETURN
; end of _Init_LM35

_Read_LM35:

;LM35.c,8 :: 		void Read_LM35(char *Temp){
;LM35.c,9 :: 		unsigned short  cent = 0;
	CLRF       Read_LM35_cent_L0+0
	CLRF       Read_LM35_diz_L0+0
	CLRF       Read_LM35_unit_L0+0
;LM35.c,12 :: 		cent = (ADC_READ(0)* 0.4887)/100;
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _word2double+0
	MOVLW      227
	MOVWF      R4+0
	MOVLW      54
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	CALL       _double2byte+0
	MOVF       R0+0, 0
	MOVWF      Read_LM35_cent_L0+0
;LM35.c,13 :: 		diz =  ((ADC_READ(0)* 0.4887) - (cent* 100))/10;
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _word2double+0
	MOVLW      227
	MOVWF      R4+0
	MOVLW      54
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__Read_LM35+0
	MOVF       R0+1, 0
	MOVWF      FLOC__Read_LM35+1
	MOVF       R0+2, 0
	MOVWF      FLOC__Read_LM35+2
	MOVF       R0+3, 0
	MOVWF      FLOC__Read_LM35+3
	MOVF       Read_LM35_cent_L0+0, 0
	MOVWF      R0+0
	MOVLW      100
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	CALL       _int2double+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVF       FLOC__Read_LM35+0, 0
	MOVWF      R0+0
	MOVF       FLOC__Read_LM35+1, 0
	MOVWF      R0+1
	MOVF       FLOC__Read_LM35+2, 0
	MOVWF      R0+2
	MOVF       FLOC__Read_LM35+3, 0
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	CALL       _double2byte+0
	MOVF       R0+0, 0
	MOVWF      Read_LM35_diz_L0+0
;LM35.c,14 :: 		unit = (ADC_READ(0)* 0.4887) - ((cent * 100 ) + (diz * 10));
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _word2double+0
	MOVLW      227
	MOVWF      R4+0
	MOVLW      54
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__Read_LM35+4
	MOVF       R0+1, 0
	MOVWF      FLOC__Read_LM35+5
	MOVF       R0+2, 0
	MOVWF      FLOC__Read_LM35+6
	MOVF       R0+3, 0
	MOVWF      FLOC__Read_LM35+7
	MOVF       Read_LM35_cent_L0+0, 0
	MOVWF      R0+0
	MOVLW      100
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__Read_LM35+0
	MOVF       R0+1, 0
	MOVWF      FLOC__Read_LM35+1
	MOVF       Read_LM35_diz_L0+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       FLOC__Read_LM35+0, 0
	ADDWF      R0+0, 1
	MOVF       FLOC__Read_LM35+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	CALL       _int2double+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVF       FLOC__Read_LM35+4, 0
	MOVWF      R0+0
	MOVF       FLOC__Read_LM35+5, 0
	MOVWF      R0+1
	MOVF       FLOC__Read_LM35+6, 0
	MOVWF      R0+2
	MOVF       FLOC__Read_LM35+7, 0
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
	CALL       _double2byte+0
	MOVF       R0+0, 0
	MOVWF      Read_LM35_unit_L0+0
;LM35.c,15 :: 		Temp[0] = cent + '0';
	MOVLW      48
	ADDWF      Read_LM35_cent_L0+0, 0
	MOVWF      R0+0
	MOVF       FARG_Read_LM35_Temp+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;LM35.c,16 :: 		Temp[1] = diz + '0';
	INCF       FARG_Read_LM35_Temp+0, 0
	MOVWF      FSR
	MOVLW      48
	ADDWF      Read_LM35_diz_L0+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      INDF+0
;LM35.c,17 :: 		Temp[2] = unit + '0';
	MOVLW      2
	ADDWF      FARG_Read_LM35_Temp+0, 0
	MOVWF      FSR
	MOVLW      48
	ADDWF      Read_LM35_unit_L0+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      INDF+0
;LM35.c,18 :: 		}
L_end_Read_LM35:
	RETURN
; end of _Read_LM35
