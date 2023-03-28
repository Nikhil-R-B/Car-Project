#define RightWheelEnable A5 //2 // Right Wheel
#define RightWheelForward 6 // Right Forward
#define RightWheelBackward 4 // Right Backward
#define LeftWheelEnable A4 //5 // Left Wheel
#define LeftWheelForward 12 // Left Forward
#define LeftWheelBackward 3 // Left Backward
#include <Servo.h>

const int trigPin = 9;
const int echoPin = 8;

Servo servo_head;

long duration;
int forwarddistance = 0;
int eastdistance = 0;
int westdistance = 0;
int northeastdistance = 0;
int northwestdistance = 0;
int highest = 0;
int highest1 = 0;
int highest2 = 0;
int head_pos = 0;

void go(){
  analogWrite(LeftWheelEnable, 175);
  analogWrite(RightWheelEnable, 175);
  digitalWrite(RightWheelForward, HIGH);
  digitalWrite(RightWheelBackward, LOW);
  digitalWrite(LeftWheelForward, HIGH);
  digitalWrite(LeftWheelBackward, LOW);
}

void left(){
  analogWrite(LeftWheelEnable, 150);
  analogWrite(RightWheelEnable, 150);
  digitalWrite(RightWheelForward, HIGH);
  digitalWrite(RightWheelBackward, LOW);
  digitalWrite(LeftWheelForward, LOW);
  digitalWrite(LeftWheelBackward, HIGH);
}

void right(){
  analogWrite(LeftWheelEnable, 150);
  analogWrite(RightWheelEnable, 150);
  digitalWrite(RightWheelForward, LOW);
  digitalWrite(RightWheelBackward, HIGH);
  digitalWrite(LeftWheelForward, HIGH);
  digitalWrite(LeftWheelBackward, LOW);
}

void back(){
  analogWrite(LeftWheelEnable, 175);
  analogWrite(RightWheelEnable, 175);
  digitalWrite(RightWheelForward, LOW);
  digitalWrite(RightWheelBackward, HIGH);
  digitalWrite(LeftWheelForward, LOW);
  digitalWrite(LeftWheelBackward, HIGH);
}

void stopp(){
  analogWrite(LeftWheelEnable, LOW);
  analogWrite(RightWheelEnable, LOW);
}

int calculateDistance(){
  digitalWrite(trigPin, LOW); 
  delayMicroseconds(2);
  // Sets the trigPin on HIGH state for 10 micro seconds
  digitalWrite(trigPin, HIGH); 
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  duration = pulseIn(echoPin, HIGH); // Reads the echoPin, returns the sound wave travel time in microseconds
  forwarddistance = duration*0.034/2;
  return forwarddistance;
}

void setup() {
  Serial.begin(9600);
  pinMode(LeftWheelEnable, OUTPUT);
  pinMode(RightWheelEnable, OUTPUT);
  pinMode(RightWheelForward, OUTPUT);
  pinMode(RightWheelBackward, OUTPUT);
  pinMode(LeftWheelForward, OUTPUT);
  pinMode(LeftWheelBackward, OUTPUT);
  pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
  pinMode(echoPin, INPUT); // Sets the echoPin as an Input
  servo_head.attach(7);
}

void loop() {
  servo_head.write(90);
  forwarddistance = calculateDistance();
  if(forwarddistance <= 22){
    stopp();
    delay(250);
    back();
    delay(250);
    stopp();
    delay(750);
    servo_head.write(45);
    delay(750);
    northeastdistance = calculateDistance();
    delay(750);
    servo_head.write(0);
    delay(750);
    eastdistance = calculateDistance();
    delay(750);
    servo_head.write(135);
    delay(750);
    northwestdistance = calculateDistance();
    delay(750);
    servo_head.write(180);
    delay(750);
    westdistance = calculateDistance();
    delay(750);
    highest1 = max(eastdistance, westdistance);
    highest2 = max(northeastdistance, northwestdistance);
    highest = max(highest1, highest2);
    if(highest1 == eastdistance){
      right();
      delay(190);
    }
    else if(highest1 == westdistance){
      left();
      delay(190);
    }
    else if(highest == northeastdistance){
      right();
      delay(60);
    }
    else if(highest == northwestdistance){
      left();
      delay(160);
    }
    servo_head.write(90);
    delay(250);
  }
  else{
    go();
  }
}
