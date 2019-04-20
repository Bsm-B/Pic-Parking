#include "EEPROM.h"

void Write_Places(unsigned short d){
   EEPROM_Write(PLACES,d);
}

void Read_Places(char *P){
  unsigned short tmp;
  tmp = EEPROM_Read(PLACES);
  ByteToStr(tmp,P);
}
void Add_Places(){
  unsigned short tmp;
  tmp = EEPROM_Read(PLACES);
  tmp ++;
  EEPROM_Write(PLACES,tmp);
}
void Sub_Places(){
  unsigned short tmp;
  tmp = EEPROM_Read(PLACES);
  tmp --;
  EEPROM_Write(PLACES,tmp);
}