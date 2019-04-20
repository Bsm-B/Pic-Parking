
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

;LM35.c,8 :: 		void Read_LM35(char ** Temp){
;LM35.c,9 :: 		int t = 0;
;LM35.c,10 :: 		int cent = 0;
;LM35.c,11 :: 		int diz = 0;
	CLRF       Read_LM35_diz_L0+0
	CLRF       Read_LM35_diz_L0+1
	CLRF       Read_LM35_unit_L0+0
	CLRF       Read_LM35_unit_L0+1
;LM35.c,13 :: 		t = ADC_READ(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
;LM35.c,14 :: 		t = t* 0.4887;
	CALL       _int2double+0
	MOVLW      227
	MOVWF      R4+0
	MOVLW      54
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      FLOC__Read_LM35+4
	MOVF       R0+1, 0
	MOVWF      FLOC__Read_LM35+5
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__Read_LM35+4, 0
	MOVWF      R0+0
	MOVF       FLOC__Read_LM35+5, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FLOC__Read_LM35+2
	MOVF       R0+1, 0
	MOVWF      FLOC__Read_LM35+3
	MOVF       FLOC__Read_LM35+2, 0
	MOVWF      R0+0
	MOVF       FLOC__Read_LM35+3, 0
	MOVWF      R0+1
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__Read_LM35+0
	MOVF       R0+1, 0
	MOVWF      FLOC__Read_LM35+1
	MOVF       FLOC__Read_LM35+0, 0
	SUBWF      FLOC__Read_LM35+4, 0
	MOVWF      R0+0
	MOVF       FLOC__Read_LM35+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      FLOC__Read_LM35+5, 0
	MOVWF      R0+1
;LM35.c,16 :: 		diz = (t - (cent* 100))/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      Read_LM35_diz_L0+0
	MOVF       R0+1, 0
	MOVWF      Read_LM35_diz_L0+1
;LM35.c,17 :: 		unit = t - ((cent * 100 ) + (diz * 10));
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       FLOC__Read_LM35+0, 0
	ADDWF      R0+0, 1
	MOVF       FLOC__Read_LM35+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	SUBWF      FLOC__Read_LM35+4, 0
	MOVWF      Read_LM35_unit_L0+0
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      FLOC__Read_LM35+5, 0
	MOVWF      Read_LM35_unit_L0+1
;LM35.c,18 :: 		Temp[0] = cent + '0';
	MOVLW      48
	ADDWF      FLOC__Read_LM35+2, 0
	MOVWF      R0+0
	MOVF       FLOC__Read_LM35+3, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       FARG_Read_LM35_Temp+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;LM35.c,19 :: 		Temp[1] = diz + '0';
	INCF       FARG_Read_LM35_Temp+0, 0
	MOVWF      FSR
	MOVLW      48
	ADDWF      Read_LM35_diz_L0+0, 0
	MOVWF      R0+0
	MOVF       Read_LM35_diz_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      INDF+0
;LM35.c,20 :: 		Temp[2] = unit + '0';
	MOVLW      2
	ADDWF      FARG_Read_LM35_Temp+0, 0
	MOVWF      FSR
	MOVLW      48
	ADDWF      Read_LM35_unit_L0+0, 0
	MOVWF      R0+0
	MOVF       Read_LM35_unit_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      INDF+0
;LM35.c,21 :: 		}
L_end_Read_LM35:
	RETURN
; end of _Read_LM35
