#line 1 "C:/Users/Bsm/Desktop/Pic-Parking/src/EEPROM.c"
#line 1 "c:/users/bsm/desktop/pic-parking/src/eeprom.h"




void Write_Places(unsigned short);
void Read_Places(char *);
unsigned short Read_Places_num();
void Add_Places();
void Sub_Places();
#line 3 "C:/Users/Bsm/Desktop/Pic-Parking/src/EEPROM.c"
void Write_Places(unsigned short d){
 EEPROM_Write( 0x10 ,d);
}
unsigned short Read_Places_num(){

 return EEPROM_Read( 0x10 );

}

void Read_Places(char *P){

 ByteToStr(EEPROM_Read( 0x10 ),P);
}
void Add_Places(){
 EEPROM_Write( 0x10 , EEPROM_Read( 0x10 )+1);
}
void Sub_Places(){
 EEPROM_Write( 0x10 ,EEPROM_Read( 0x10 )-1);
}
