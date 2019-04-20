#include "src/LCD.h"
#include "src/EEPROM.h"
#include "src/LM35.h"
#include "src/Sensor.h"
#include "src/Control.h"

char Temp[] = "000";
char Pt[3];
void main() {
     Init_LCD();
     Init_LM35();
     Init_Sensor();
     Init_Control();
     do{
     Read_LM35( Temp);
     LCD_Out(1,1,Temp);
     Read_Places(Pt);
     LCD_Out(2,1,Pt);
     }while(1);
}