#line 1 "C:/Users/Bsm/Desktop/Pic-Parking/src/Sensor.c"
#line 1 "c:/users/bsm/desktop/pic-parking/src/sensor.h"



void Init_Sensor();
void interruption();
void Open_Bar();
void Close_Bar();
#line 5 "C:/Users/Bsm/Desktop/Pic-Parking/src/Sensor.c"
void interruption(){

 if (INTCON.RBIF){
 if (PORTB.RB6) {

 Open_Bar();


 }
 if (PORTB.RB7){

 Close_Bar();


 }

 INTCON.RBIF = 0;
 }


}

void Init_Sensor(){
 TRISB = 0xFF;
 INTCON = 0b10001000;
 OPTION_REG.INTEDG = 1;


}
