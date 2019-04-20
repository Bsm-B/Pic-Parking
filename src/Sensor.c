#include "Sensor.h"
#include "EEPROM.h"
#include "Control.h"


void Init_Sensor(){
     TRISB = 0xFF; // TRISB INPUT
     INTCON = 0b10001000; // RB interruption
     OPTION_REG.INTEDG = 1;  // Falling Edge
}
