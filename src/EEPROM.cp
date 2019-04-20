#line 1 "C:/Users/Bsm/Desktop/Pic-Parking/src/EEPROM.c"
#line 1 "c:/users/bsm/desktop/pic-parking/src/eeprom.h"




void Write_Places(unsigned short);
void Read_Places(char *);
void Add_Places();
void Sub_Places();
#line 3 "C:/Users/Bsm/Desktop/Pic-Parking/src/EEPROM.c"
void Write_Places(unsigned short d){
 EEPROM_Write( 0x10 ,d);
}

void Read_Places(char *P){
 unsigned short tmp;
 tmp = EEPROM_Read( 0x10 );
 ByteToStr(tmp,P);
}
void Add_Places(){
 unsigned short tmp;
 tmp = EEPROM_Read( 0x10 );
 tmp ++;
 EEPROM_Write( 0x10 ,tmp);
}
void Sub_Places(){
 unsigned short tmp;
 tmp = EEPROM_Read( 0x10 );
 tmp --;
 EEPROM_Write( 0x10 ,tmp);
}
