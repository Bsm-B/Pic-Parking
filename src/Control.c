#include "Control.h"

void Init_Control(){
    TRISC = 0x00; // TRISC AS OUTPUT
    PORTC = 0; // INIT PPORTC
}

void Motor1(){
     portc.RC2 = 1;          // OPEN BARRE - MOTOR
     Delay_ms(5000);         // DELAY 8s
     portc.RC2 = 0;          // STOP
     Delay_ms(8000);       // DELAY 10s
     portc.RC3 = 1;           // CLOSE BARRE - MOTOR
     Delay_ms(5000);          // DELAY 8s
     portc.RC3 = 0;             // STOP
}

void Motor2(){
     portc.RC2 = 1;          // OPEN BARRE - MOTOR
     Delay_ms(5000);         // DELAY 8s
     portc.RC2 = 0;          // STOP
     Delay_ms(8000);       // DELAY 10s
     portc.RC3 = 1;           // CLOSE BARRE - MOTOR
     Delay_ms(5000);          // DELAY 8s
     portc.RC3 = 0;             // STOP
}


void Free_Places()
{
  int i;
  for(i=0;i<6;i++){
  PORTC.RC0 =~ PORTC.RC0;         // OPEN & CLOSE LED
  Delay_ms(500);
  }
}


void Full_Places()
{
  int i;
  for(i=0;i<6;i++){
  PORTC.RC1 =~ PORTC.RC1;      // OPEN & CLOSE LED
  Delay_ms(500);
  }
}