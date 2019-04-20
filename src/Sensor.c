#include "Sensor.h"


void interruption(){

     if (INTCON.RBIF){
       if (PORTB.RB6) {

                      Open_Bar();


              }
        if (PORTB.RB7){

                      Close_Bar();


             }

             INTCON.RBIF  = 0; //REST FLAG
     }


}

void Init_Sensor(){
     TRISB = 0xFF; // TRISB INPUT
     INTCON = 0b10001000; // RB interruption
     OPTION_REG.INTEDG = 1;  // Falling Edge

     
}