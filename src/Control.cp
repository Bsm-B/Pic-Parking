#line 1 "C:/Users/Bsm/Desktop/Pic-Parking/src/Control.c"
#line 1 "c:/users/bsm/desktop/pic-parking/src/control.h"




void Init_Control();
void Motor1();
void Motor2();
void Free_Places();
void Full_Places();
#line 3 "C:/Users/Bsm/Desktop/Pic-Parking/src/Control.c"
void Init_Control(){
 TRISC = 0x00;
 PORTC = 0;
}

void Motor1(){
 portc.RC2 = 1;
 Delay_ms(3000);
 portc.RC2 = 0;
 Delay_ms(4000);
 portc.RC3 = 1;
 Delay_ms(3000);
 portc.RC3 = 0;
}

void Motor2(){
 portc.RC4 = 1;
 Delay_ms(3000);
 portc.RC4 = 0;
 Delay_ms(4000);
 portc.RC5 = 1;
 Delay_ms(3000);
 portc.RC5 = 0;
}


void Free_Places()
{
 short i;
 for(i=0;i<6;i++){
 PORTC.RC0 =~ PORTC.RC0;
 Delay_ms(300);
 }
}


void Full_Places()
{

 short i;
 for(i=0;i<6;i++){
 PORTC.RC1 =~ PORTC.RC1;
 Delay_ms(300);
 }
}
