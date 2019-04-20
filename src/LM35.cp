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
 int t = 0;
 int cent = 0;
 int diz = 0;
 int unit = 0;
 t = ADC_READ(0);
 t = t* 0.4887;
 cent = t/100;
 diz = (t - (cent* 100))/10;
 unit = t - ((cent * 100 ) + (diz * 10));
 Temp[0] = cent + '0';
 Temp[1] = diz + '0';
 Temp[2] = unit + '0';
}
