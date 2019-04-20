#include "LCD.h"

void Init_LCD(){

  Lcd_Init();                     // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);         //  Disable cursor

}