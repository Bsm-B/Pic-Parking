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
     LCD_Out(1,1,"Temp:");
     LCD_Out(2,1,"Places:");
     Read_LM35(Temp);
     Read_Places(Pt);
     LCD_Out(1,8,Temp);
     LCD_Out(2,9,Pt);
     }while(1);
}