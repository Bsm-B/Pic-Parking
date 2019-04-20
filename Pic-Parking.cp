#line 1 "C:/Users/Bsm/Desktop/Pic-Parking/Pic-Parking.c"
#line 1 "c:/users/bsm/desktop/pic-parking/src/lcd.h"




sbit LCD_RS at RD0_bit;
sbit LCD_EN at RD1_bit;
sbit LCD_D4 at RD2_bit;
sbit LCD_D5 at RD3_bit;
sbit LCD_D6 at RD4_bit;
sbit LCD_D7 at RD5_bit;

sbit LCD_RS_Direction at TRISD0_bit;
sbit LCD_EN_Direction at TRISD1_bit;
sbit LCD_D4_Direction at TRISD2_bit;
sbit LCD_D5_Direction at TRISD3_bit;
sbit LCD_D6_Direction at TRISD4_bit;
sbit LCD_D7_Direction at TRISD5_bit;



void Init_LCD();
#line 1 "c:/users/bsm/desktop/pic-parking/src/eeprom.h"




void Write_Places(unsigned short);
void Read_Places(char *);
unsigned short Read_Places_num();
void Add_Places();
void Sub_Places();
#line 1 "c:/users/bsm/desktop/pic-parking/src/lm35.h"




void Init_LM35();

void Read_LM35(char *);
#line 1 "c:/users/bsm/desktop/pic-parking/src/sensor.h"


void Init_Sensor();
#line 1 "c:/users/bsm/desktop/pic-parking/src/control.h"




void Init_Control();
void Motor1();
void Motor2();
void Free_Places();
void Full_Places();
#line 7 "C:/Users/Bsm/Desktop/Pic-Parking/Pic-Parking.c"
char Temp[] = "000";
char Pt[3];
unsigned char flag = 0;

 void interrupt (void) {
 if (INTCON.RBIF){
 if (PORTB.RB6) {

 flag = 1;

 }
 if (PORTB.RB7){

 flag = 2;

 }

 INTCON.RBIF = 0;
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
 } while(!(wait == 50 || pay == 1));
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
