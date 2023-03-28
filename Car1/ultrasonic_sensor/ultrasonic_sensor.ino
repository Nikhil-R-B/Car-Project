//#include <Ultrasonic.h>
#include <Servo.h>

//#define trig_pin 9
//#define echo_pin 8
const int trigPin = 9;
const int echoPin = 8;

//Ultrasonic ultrasonic = Ultrasonic(echo_pin, trig_pin);
Servo servo_head;

long duration;
int distance = 0;
int head_pos = 0;

void setup() {
  pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
  pinMode(echoPin, INPUT); // Sets the echoPin as an Input
  Serial.begin(9600);
  servo_head.attach(7);
}

void loop() {
  for(int i = 0; i < 181; i++){
    servo_head.write(i);
    delay(20);
    //distance = ultrasonic.Distance();
    distance = calculateDistance();
    delay(20);
    Serial.print(i);
    Serial.print(",");
    Serial.print(distance);
    Serial.print(".");
  }
  for(int i = 180; i > 0; i--){
    servo_head.write(i);
    delay(20);
    //distance = ultrasonic.Distance();
    distance = calculateDistance();
    delay(20);
    Serial.print(i);
    Serial.print(",");
    Serial.print(distance);
    Serial.print(".");
  }
}

int calculateDistance(){
  digitalWrite(trigPin, LOW); 
  delayMicroseconds(2);
  // Sets the trigPin on HIGH state for 10 micro seconds
  digitalWrite(trigPin, HIGH); 
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  duration = pulseIn(echoPin, HIGH); // Reads the echoPin, returns the sound wave travel time in microseconds
  distance = duration*0.034/2;
  return distance;
}
