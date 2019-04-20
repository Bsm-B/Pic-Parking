#include "src/LCD.h"
#include "src/EEPROM.h"
#include "src/LM35.h"
#include "src/Sensor.h"

char Temp[] = "000";

void main() {
     Init_LCD();
     Init_LM35();
     do{
     Read_LM35( Temp);
     LCD_Out(1,1,Temp);
     }while(1);
     

}