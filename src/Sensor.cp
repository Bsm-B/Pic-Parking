#line 1 "C:/Users/Bsm/Desktop/Pic-Parking/src/Sensor.c"
#line 1 "c:/users/bsm/desktop/pic-parking/src/sensor.h"


void Init_Sensor();
#line 1 "c:/users/bsm/desktop/pic-parking/src/eeprom.h"




void Write_Places(unsigned short);
void Read_Places(char *);
unsigned short Read_Places_num();
void Add_Places();
void Sub_Places();
#line 1 "c:/users/bsm/desktop/pic-parking/src/control.h"




void Init_Control();
void Motor1();
void Motor2();
void Free_Places();
void Full_Places();
#line 6 "C:/Users/Bsm/Desktop/Pic-Parking/src/Sensor.c"
void Init_Sensor(){
 TRISB = 0xFF;
 INTCON = 0b10001000;
 OPTION_REG.INTEDG = 1;
}
