#include <Servo.h>

Servo servo1; //Naming an object servo1 which refres to the servo

void setup() {
  Serial.begin(9600); //This is the baud rate (how many bits per second)
  servo1.attach(7); //Intialising the pins
}

void loop() {
  while(1){
    int s_angle = 0;
    int i;
    if(s_angle == 0){
      for(i = 0; i < 181; i = i + 1){
            delay(20);
            s_angle = i;
            servo1.write(s_angle);
      }
    }
    if(s_angle == 180){
      for(i = 180; i > 0; i = i - 1){
            delay(20);
            s_angle = i;
            servo1.write(s_angle);
      }
    }
  }
}
