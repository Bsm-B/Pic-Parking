#ifndef EEPROM_H_INCLUDED
#define EEPROM_H_INCLUDED
#define PLACES 0x10

void Write_Places(unsigned short);
void Read_Places(char *);
unsigned short Read_Places_num();
void Add_Places();
void Sub_Places();



#endif