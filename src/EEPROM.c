#include "EEPROM.h"

void Write_Places(unsigned short d){
   EEPROM_Write(PLACES,d);
}
unsigned short Read_Places_num(){

 return EEPROM_Read(PLACES);

}

void Read_Places(char *P){

  ByteToStr(EEPROM_Read(PLACES),P);
}
void Add_Places(){
  EEPROM_Write(PLACES, EEPROM_Read(PLACES)+1);
}
void Sub_Places(){
  EEPROM_Write(PLACES,EEPROM_Read(PLACES)-1);
}