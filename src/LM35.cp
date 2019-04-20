#line 1 "C:/Users/Bsm/Desktop/Pic-Parking/src/LM35.c"
#line 1 "c:/users/bsm/desktop/pic-parking/src/lm35.h"




void Init_LM35();

void Read_LM35(char *);
#line 3 "C:/Users/Bsm/Desktop/Pic-Parking/src/LM35.c"
void Init_LM35(){
 TRISA = 0xFF;
 ADCON1 = 0x0E;
}

void Read_LM35(char *Temp){
 unsigned short cent = 0;
 unsigned short diz = 0;
 unsigned short unit = 0;
 cent = (ADC_READ(0)* 0.4887)/100;
 diz = ((ADC_READ(0)* 0.4887) - (cent* 100))/10;
 unit = (ADC_READ(0)* 0.4887) - ((cent * 100 ) + (diz * 10));
 Temp[0] = cent + '0';
 Temp[1] = diz + '0';
 Temp[2] = unit + '0';
}
