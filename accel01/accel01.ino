#include <Wire.h>
#include <ADXL345.h>

ADXL345 adxl;
int x, y, z;
int x_pre;

void setup() {
  Serial.begin(9600);
  adxl.powerOn();
  x = 0;
  y = 0;
  z = 0;
  x_pre=0;
}

void loop() {
  adxl.readXYZ(&x, &y, &z);

  if(abs( x_pre - x ) > 50 ){
    Serial.print('a');
  }
  

  x_pre =x;
  delay(10);
}
