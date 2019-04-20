
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
;Control.c,10 :: 		Delay_ms(3000);         // DELAY 8s
	MOVLW      61
	MOVWF      R11+0
	MOVLW      225
	MOVWF      R12+0
	MOVLW      63
	MOVWF      R13+0
L_Motor10:
	DECFSZ     R13+0, 1
	GOTO       L_Motor10
	DECFSZ     R12+0, 1
	GOTO       L_Motor10
	DECFSZ     R11+0, 1
	GOTO       L_Motor10
	NOP
	NOP
;Control.c,11 :: 		portc.RC2 = 0;          // STOP
	BCF        PORTC+0, 2
;Control.c,12 :: 		Delay_ms(4000);       // DELAY 10s
	MOVLW      82
	MOVWF      R11+0
	MOVLW      43
	MOVWF      R12+0
	MOVLW      0
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
;Control.c,14 :: 		Delay_ms(3000);          // DELAY 8s
	MOVLW      61
	MOVWF      R11+0
	MOVLW      225
	MOVWF      R12+0
	MOVLW      63
	MOVWF      R13+0
L_Motor12:
	DECFSZ     R13+0, 1
	GOTO       L_Motor12
	DECFSZ     R12+0, 1
	GOTO       L_Motor12
	DECFSZ     R11+0, 1
	GOTO       L_Motor12
	NOP
	NOP
;Control.c,15 :: 		portc.RC3 = 0;             // STOP
	BCF        PORTC+0, 3
;Control.c,16 :: 		}
L_end_Motor1:
	RETURN
; end of _Motor1

_Motor2:

;Control.c,18 :: 		void Motor2(){
;Control.c,19 :: 		portc.RC4 = 1;          // OPEN BARRE - MOTOR
	BSF        PORTC+0, 4
;Control.c,20 :: 		Delay_ms(3000);         // DELAY 8s
	MOVLW      61
	MOVWF      R11+0
	MOVLW      225
	MOVWF      R12+0
	MOVLW      63
	MOVWF      R13+0
L_Motor23:
	DECFSZ     R13+0, 1
	GOTO       L_Motor23
	DECFSZ     R12+0, 1
	GOTO       L_Motor23
	DECFSZ     R11+0, 1
	GOTO       L_Motor23
	NOP
	NOP
;Control.c,21 :: 		portc.RC4 = 0;          // STOP
	BCF        PORTC+0, 4
;Control.c,22 :: 		Delay_ms(4000);       // DELAY 10s
	MOVLW      82
	MOVWF      R11+0
	MOVLW      43
	MOVWF      R12+0
	MOVLW      0
	MOVWF      R13+0
L_Motor24:
	DECFSZ     R13+0, 1
	GOTO       L_Motor24
	DECFSZ     R12+0, 1
	GOTO       L_Motor24
	DECFSZ     R11+0, 1
	GOTO       L_Motor24
	NOP
;Control.c,23 :: 		portc.RC5 = 1;           // CLOSE BARRE - MOTOR
	BSF        PORTC+0, 5
;Control.c,24 :: 		Delay_ms(3000);          // DELAY 8s
	MOVLW      61
	MOVWF      R11+0
	MOVLW      225
	MOVWF      R12+0
	MOVLW      63
	MOVWF      R13+0
L_Motor25:
	DECFSZ     R13+0, 1
	GOTO       L_Motor25
	DECFSZ     R12+0, 1
	GOTO       L_Motor25
	DECFSZ     R11+0, 1
	GOTO       L_Motor25
	NOP
	NOP
;Control.c,25 :: 		portc.RC5 = 0;             // STOP
	BCF        PORTC+0, 5
;Control.c,26 :: 		}
L_end_Motor2:
	RETURN
; end of _Motor2

_Free_Places:

;Control.c,29 :: 		void Free_Places()
;Control.c,32 :: 		for(i=0;i<6;i++){
	CLRF       R1+0
L_Free_Places6:
	MOVLW      128
	XORWF      R1+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      6
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Free_Places7
;Control.c,33 :: 		PORTC.RC0 =~ PORTC.RC0;         // OPEN & CLOSE LED
	MOVLW      1
	XORWF      PORTC+0, 1
;Control.c,34 :: 		Delay_ms(300);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      23
	MOVWF      R12+0
	MOVLW      106
	MOVWF      R13+0
L_Free_Places9:
	DECFSZ     R13+0, 1
	GOTO       L_Free_Places9
	DECFSZ     R12+0, 1
	GOTO       L_Free_Places9
	DECFSZ     R11+0, 1
	GOTO       L_Free_Places9
	NOP
;Control.c,32 :: 		for(i=0;i<6;i++){
	INCF       R1+0, 1
;Control.c,35 :: 		}
	GOTO       L_Free_Places6
L_Free_Places7:
;Control.c,36 :: 		}
L_end_Free_Places:
	RETURN
; end of _Free_Places

_Full_Places:

;Control.c,39 :: 		void Full_Places()
;Control.c,43 :: 		for(i=0;i<6;i++){
	CLRF       R1+0
L_Full_Places10:
	MOVLW      128
	XORWF      R1+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      6
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Full_Places11
;Control.c,44 :: 		PORTC.RC1 =~ PORTC.RC1;      // OPEN & CLOSE LED
	MOVLW      2
	XORWF      PORTC+0, 1
;Control.c,45 :: 		Delay_ms(300);
	MOVLW      7
	MOVWF      R11+0
	MOVLW      23
	MOVWF      R12+0
	MOVLW      106
	MOVWF      R13+0
L_Full_Places13:
	DECFSZ     R13+0, 1
	GOTO       L_Full_Places13
	DECFSZ     R12+0, 1
	GOTO       L_Full_Places13
	DECFSZ     R11+0, 1
	GOTO       L_Full_Places13
	NOP
;Control.c,43 :: 		for(i=0;i<6;i++){
	INCF       R1+0, 1
;Control.c,46 :: 		}
	GOTO       L_Full_Places10
L_Full_Places11:
;Control.c,47 :: 		}
L_end_Full_Places:
	RETURN
; end of _Full_Places
