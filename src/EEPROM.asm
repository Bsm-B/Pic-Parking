
_Write_Places:

;EEPROM.c,3 :: 		void Write_Places(unsigned short d){
;EEPROM.c,4 :: 		EEPROM_Write(PLACES,d);
	MOVLW      16
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       FARG_Write_Places_d+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;EEPROM.c,5 :: 		}
L_end_Write_Places:
	RETURN
; end of _Write_Places

_Read_Places:

;EEPROM.c,7 :: 		void Read_Places(char *P){
;EEPROM.c,9 :: 		tmp = EEPROM_Read(PLACES);
	MOVLW      16
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
;EEPROM.c,10 :: 		ByteToStr(tmp,P);
	MOVF       R0+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVF       FARG_Read_Places_P+0, 0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;EEPROM.c,11 :: 		}
L_end_Read_Places:
	RETURN
; end of _Read_Places

_Add_Places:

;EEPROM.c,12 :: 		void Add_Places(){
;EEPROM.c,14 :: 		tmp = EEPROM_Read(PLACES);
	MOVLW      16
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
;EEPROM.c,15 :: 		tmp ++;
	INCF       R0+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
;EEPROM.c,16 :: 		EEPROM_Write(PLACES,tmp);
	MOVLW      16
	MOVWF      FARG_EEPROM_Write_Address+0
	CALL       _EEPROM_Write+0
;EEPROM.c,17 :: 		}
L_end_Add_Places:
	RETURN
; end of _Add_Places

_Sub_Places:

;EEPROM.c,18 :: 		void Sub_Places(){
;EEPROM.c,20 :: 		tmp = EEPROM_Read(PLACES);
	MOVLW      16
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
;EEPROM.c,21 :: 		tmp --;
	DECF       R0+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
;EEPROM.c,22 :: 		EEPROM_Write(PLACES,tmp);
	MOVLW      16
	MOVWF      FARG_EEPROM_Write_Address+0
	CALL       _EEPROM_Write+0
;EEPROM.c,23 :: 		}
L_end_Sub_Places:
	RETURN
; end of _Sub_Places
