#define RightWheelEnable A5 //2 // Right Wheel
#define RightWheelForward 6 // Right Forward
#define RightWheelBackward 4 // Right Backward
#define LeftWheelEnable A4 //5 // Left Wheel
#define LeftWheelForward 12 // Left Forward
#define LeftWheelBackward 3 // Left Backward

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

void setup() {
  Serial.begin(9600);
  pinMode(LeftWheelEnable, OUTPUT);
  pinMode(RightWheelEnable, OUTPUT);
  pinMode(RightWheelForward, OUTPUT);
  pinMode(RightWheelBackward, OUTPUT);
  pinMode(LeftWheelForward, OUTPUT);
  pinMode(LeftWheelBackward, OUTPUT);
}

void loop() {
  go();
  delay(1000);
  stopp();
  delay(1000);
  back();
  delay(1000);
  stopp();
  delay(1000);
  left();
  delay(1000);
  stopp();
  delay(1000);
  right();
  delay(1000);
  stopp();
  delay(1000);
}
