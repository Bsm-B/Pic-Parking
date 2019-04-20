#include "src/LCD.h"
#include "src/EEPROM.h"
#include "src/LM35.h"
#include "src/Sensor.h"
#include "src/Control.h"

char Temp[] = "000";
char Pt[3];
unsigned char flag = 0;

 void interrupt (void) {
      if (INTCON.RBIF){
       if (PORTB.RB6) {

               flag  = 1;

              }
        if (PORTB.RB7){

                 flag  = 2;

             }

             INTCON.RBIF  = 0; //REST FLAG
     }
 }


void main() {
     Init_LCD();
     Init_LM35();
     Init_Sensor();
     Init_Control();

     do{
     if (flag == 1) {
          if (Read_Places_num() > 0)
          {
             Free_Places();
             LCD_Cmd(_LCD_CLEAR);
             LCD_Out(1,3,"Welcome :) ");
             Motor1();
             Lcd_Cmd(_LCD_CLEAR);
             Sub_Places();
          }else{
             Full_Places();
              Lcd_Cmd(_LCD_CLEAR);
              LCD_Out(1,1,"Sorry,Full :(");
              Delay_ms(2000);
              Lcd_Cmd(_LCD_CLEAR);
          }
          flag = 0;
     }
     if (flag == 2){
          unsigned short wait=0;
          unsigned short pay = 0;
          LCD_Cmd(_LCD_CLEAR);
          LCD_Out(1,1,"Wait for payment:) ");
           do{
             if (PORTB.RB0) {
             pay = 1;
             LCD_Cmd(_LCD_CLEAR);
             LCD_Out(1,4,"Thank you :D ");
             Delay_ms(1000);
             LCD_Cmd(_LCD_CLEAR);
             }
             wait++;
             Delay_ms(100);
           }  while(!(wait == 50 ||  pay == 1));
           if (pay == 1){
             LCD_Cmd(_LCD_CLEAR);
             LCD_Out(1,3,"Good Bye :) ");
             Motor2();
             LCD_Cmd(_LCD_CLEAR);
             Add_Places();
           }else{
             LCD_Cmd(_LCD_CLEAR);
             LCD_Out(1,1,"You must pay !");
             Delay_ms(1000);
             Lcd_Cmd(_LCD_CLEAR);
           }
            flag = 0;
     }
     LCD_Out(1,1,"Temp:");
     LCD_Out(2,1,"Places:");
     Read_LM35(Temp);
     Read_Places(Pt);
     LCD_Out(1,8,Temp);
     LCD_Out(2,9,Pt);

     }while(1);
}