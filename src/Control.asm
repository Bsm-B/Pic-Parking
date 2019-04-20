
_Init_Control:

;Control.c,3 :: 		void Init_Control(){
;Control.c,4 :: 		TRISC = 0x00; // TRISC AS OUTPUT
	CLRF       TRISC+0
;Control.c,5 :: 		PORTC = 0; // INIT PPORTC
	CLRF       PORTC+0
;Control.c,6 :: 		}
L_end_Init_Control:
	RETURN
; end of _Init_Control

_Motor1:

;Control.c,8 :: 		void Motor1(){
;Control.c,9 :: 		portc.RC2 = 1;          // OPEN BARRE - MOTOR
	BSF        PORTC+0, 2
;Control.c,10 :: 		Delay_ms(5000);         // DELAY 8s
	MOVLW      102
	MOVWF      R11+0
	MOVLW      118
	MOVWF      R12+0
	MOVLW      193
	MOVWF      R13+0
L_Motor10:
	DECFSZ     R13+0, 1
	GOTO       L_Motor10
	DECFSZ     R12+0, 1
	GOTO       L_Motor10
	DECFSZ     R11+0, 1
	GOTO       L_Motor10
;Control.c,11 :: 		portc.RC2 = 0;          // STOP
	BCF        PORTC+0, 2
;Control.c,12 :: 		Delay_ms(8000);       // DELAY 10s
	MOVLW      163
	MOVWF      R11+0
	MOVLW      87
	MOVWF      R12+0
	MOVLW      2
	MOVWF      R13+0
L_Motor11:
	DECFSZ     R13+0, 1
	GOTO       L_Motor11
	DECFSZ     R12+0, 1
	GOTO       L_Motor11
	DECFSZ     R11+0, 1
	GOTO       L_Motor11
	NOP
;Control.c,13 :: 		portc.RC3 = 1;           // CLOSE BARRE - MOTOR
	BSF        PORTC+0, 3
;Control.c,14 :: 		Delay_ms(5000);          // DELAY 8s
	MOVLW      102
	MOVWF      R11+0
	MOVLW      118
	MOVWF      R12+0
	MOVLW      193
	MOVWF      R13+0
L_Motor12:
	DECFSZ     R13+0, 1
	GOTO       L_Motor12
	DECFSZ     R12+0, 1
	GOTO       L_Motor12
	DECFSZ     R11+0, 1
	GOTO       L_Motor12
;Control.c,15 :: 		portc.RC3 = 0;             // STOP
	BCF        PORTC+0, 3
;Control.c,16 :: 		}
L_end_Motor1:
	RETURN
; end of _Motor1

_Motor2:

;Control.c,18 :: 		void Motor2(){
;Control.c,19 :: 		portc.RC2 = 1;          // OPEN BARRE - MOTOR
	BSF        PORTC+0, 2
;Control.c,20 :: 		Delay_ms(5000);         // DELAY 8s
	MOVLW      102
	MOVWF      R11+0
	MOVLW      118
	MOVWF      R12+0
	MOVLW      193
	MOVWF      R13+0
L_Motor23:
	DECFSZ     R13+0, 1
	GOTO       L_Motor23
	DECFSZ     R12+0, 1
	GOTO       L_Motor23
	DECFSZ     R11+0, 1
	GOTO       L_Motor23
;Control.c,21 :: 		portc.RC2 = 0;          // STOP
	BCF        PORTC+0, 2
;Control.c,22 :: 		Delay_ms(8000);       // DELAY 10s
	MOVLW      163
	MOVWF      R11+0
	MOVLW      87
	MOVWF      R12+0
	MOVLW      2
	MOVWF      R13+0
L_Motor24:
	DECFSZ     R13+0, 1
	GOTO       L_Motor24
	DECFSZ     R12+0, 1
	GOTO       L_Motor24
	DECFSZ     R11+0, 1
	GOTO       L_Motor24
	NOP
;Control.c,23 :: 		portc.RC3 = 1;           // CLOSE BARRE - MOTOR
	BSF        PORTC+0, 3
;Control.c,24 :: 		Delay_ms(5000);          // DELAY 8s
	MOVLW      102
	MOVWF      R11+0
	MOVLW      118
	MOVWF      R12+0
	MOVLW      193
	MOVWF      R13+0
L_Motor25:
	DECFSZ     R13+0, 1
	GOTO       L_Motor25
	DECFSZ     R12+0, 1
	GOTO       L_Motor25
	DECFSZ     R11+0, 1
	GOTO       L_Motor25
;Control.c,25 :: 		portc.RC3 = 0;             // STOP
	BCF        PORTC+0, 3
;Control.c,26 :: 		}
L_end_Motor2:
	RETURN
; end of _Motor2

_Free_Places:

;Control.c,29 :: 		void Free_Places()
;Control.c,32 :: 		for(i=0;i<6;i++){
	CLRF       R1+0
	CLRF       R1+1
L_Free_Places6:
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Free_Places18
	MOVLW      6
	SUBWF      R1+0, 0
L__Free_Places18:
	BTFSC      STATUS+0, 0
	GOTO       L_Free_Places7
;Control.c,33 :: 		PORTC.RC0 =~ PORTC.RC0;         // OPEN & CLOSE LED
	MOVLW      1
	XORWF      PORTC+0, 1
;Control.c,34 :: 		Delay_ms(500);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_Free_Places9:
	DECFSZ     R13+0, 1
	GOTO       L_Free_Places9
	DECFSZ     R12+0, 1
	GOTO       L_Free_Places9
	DECFSZ     R11+0, 1
	GOTO       L_Free_Places9
	NOP
	NOP
;Control.c,32 :: 		for(i=0;i<6;i++){
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;Control.c,35 :: 		}
	GOTO       L_Free_Places6
L_Free_Places7:
;Control.c,36 :: 		}
L_end_Free_Places:
	RETURN
; end of _Free_Places

_Full_Places:

;Control.c,39 :: 		void Full_Places()
;Control.c,42 :: 		for(i=0;i<6;i++){
	CLRF       R1+0
	CLRF       R1+1
L_Full_Places10:
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Full_Places20
	MOVLW      6
	SUBWF      R1+0, 0
L__Full_Places20:
	BTFSC      STATUS+0, 0
	GOTO       L_Full_Places11
;Control.c,43 :: 		PORTC.RC1 =~ PORTC.RC1;      // OPEN & CLOSE LED
	MOVLW      2
	XORWF      PORTC+0, 1
;Control.c,44 :: 		Delay_ms(500);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_Full_Places13:
	DECFSZ     R13+0, 1
	GOTO       L_Full_Places13
	DECFSZ     R12+0, 1
	GOTO       L_Full_Places13
	DECFSZ     R11+0, 1
	GOTO       L_Full_Places13
	NOP
	NOP
;Control.c,42 :: 		for(i=0;i<6;i++){
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;Control.c,45 :: 		}
	GOTO       L_Full_Places10
L_Full_Places11:
;Control.c,46 :: 		}
L_end_Full_Places:
	RETURN
; end of _Full_Places
