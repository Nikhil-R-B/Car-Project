import processing.serial.*; // imports library for serial communication
import java.awt.event.KeyEvent; // imports library for reading the data from the serial port
import java.io.IOException;

Serial myPort; // defines Object Serial
// defubes variables
String angle="";
String distance="";
String data="";
String noObject;
float pixsDistance;
int iAngle, iDistance;
int index1=0;
int index2=0;
PFont myFont;

void setup() {
  
 size (1920, 1080);
 smooth();
 myPort = new Serial(this,"COM3", 9600); // starts the serial communication
 myPort.bufferUntil('.'); // reads the data from the serial port up to the character '.'. So actually it reads this: angle,distance.
 myFont = createFont("verdana", 12);
}

void draw() {
  
  fill(98,245,31);
  textFont(myFont);
  // simulating motion blur and slow fade of the moving line
  noStroke();
  fill(0,4); 
  rect(0, 0, width, 1010);
  //fill(98,245,31); // green color
  //fill(255,255,255); // green color
  // calls the functions for drawing the radar
  drawRadar(); 
  drawLine();
  drawObject();
  drawText();
}

void serialEvent (Serial myPort) { // starts reading data from the Serial Port
  // reads the data from the Serial Port up to the character '.' and puts it into the String variable "data".
  data = myPort.readStringUntil('.');
  data = data.substring(0,data.length()-1);
  
  index1 = data.indexOf(","); // find the character ',' and puts it into the variable "index1"
  angle= data.substring(0, index1); // read the data from position "0" to position of the variable index1 or thats the value of the angle the Arduino Board sent into the Serial Port
  distance= data.substring(index1+1, data.length()); // read the data from position "index1" to the end of the data pr thats the value of the distance
  
  // converts the String variables into Integer
  iAngle = int(angle);
  iDistance = int(distance);
}

void drawRadar() {
  pushMatrix();
  translate(960,1000); // moves the starting coordinats to new location
  noFill();
  strokeWeight(2);
  stroke(98,245,31);
  // draws the arc lines
  for(int i = 0; i < 10; i++){
    arc(0,0,(200*i),(200*i),PI,TWO_PI); //Draw the arcs for the different distances
  }
  for(int i = 0; i < 7; i++){
    line(0,0,-900*cos(radians(30*i)),-900*sin(radians(30*i))); // Draw the angle lines
  }
  popMatrix();
}

void drawObject() {
  pushMatrix();
  translate(960,1000); // moves the starting coordinats to new location
  strokeWeight(9);
  stroke(255,10,10); // red color
  pixsDistance = iDistance*10; // covers the distance from the sensor from cm to pixels
  // limiting the range to 90 cms 
  if(iDistance<90){
    // draws the object according to the angle and the distance
  line(pixsDistance*cos(radians(iAngle)),-pixsDistance*sin(radians(iAngle)),900*cos(radians(iAngle)),-900*sin(radians(iAngle)));
  //point(pixsDistance*cos(radians(iAngle)),-pixsDistance*sin(radians(iAngle)));
  }
  popMatrix();
}

void drawLine() {
  pushMatrix();
  strokeWeight(9);
  stroke(30,250,60);
  translate(960,1000); // moves the starting coordinats to new location
  line(0,0,900*cos(radians(iAngle)),-900*sin(radians(iAngle))); // draws the line according to the angle
  popMatrix();
}

void drawText() { // draws the texts on the screen
  
  pushMatrix();
  if(iDistance > 90) {
  noObject = "Nothing in Range";
  }
  else if(iDistance <= 90 && iDistance > 50) {
  noObject = "Something Far Away";
  }
  else if (iDistance <= 50 && iDistance > 20){
    noObject = "Something Close";
  }
  else{
    noObject = "Something Very Close";
  }
  fill(0,0,0);
  noStroke();
  rect(0, 1010, width, 1080);
  fill(98,245,31);
  textSize(25);
  String Radar_distances[] = {"10cm", "20cm", "30cm", "40cm", "50cm", "60cm", "70cm", "80cm"};
  for(int i = 0; i < 8; i++){
    text(Radar_distances[i], (1080+(100*i)), 990);
  }
  textSize(40);
  text("Object: " + noObject, 240, 1050);
  text("Angle: " + iAngle +" °", 1050, 1050);
  text("Distance: ", 1380, 1050);
  if(iDistance <= 90 && iDistance > 0) {
  text("        " + iDistance +" cm", 1500, 1050);
  }
  if (iDistance > 90){
    text("        ", 1500, 1050);
  }
  if (iDistance == 0){
    text("        ", 1500, 1050);
  }
  textSize(25);
  fill(98,245,60);
  translate(961+900*cos(radians(30)),982-900*sin(radians(30)));
  rotate(-radians(-60));
  text("30°",0,0);
  resetMatrix();
  translate(954+900*cos(radians(60)),984-900*sin(radians(60)));
  rotate(-radians(-30));
  text("60°",0,0);
  resetMatrix();
  translate(945+900*cos(radians(90)),990-900*sin(radians(90)));
  rotate(radians(0));
  text("90°",0,0);
  resetMatrix();
  translate(935+900*cos(radians(120)),1003-900*sin(radians(120)));
  rotate(radians(-30));
  text("120°",0,0);
  resetMatrix();
  translate(940+900*cos(radians(150)),1018-900*sin(radians(150)));
  rotate(radians(-60));
  text("150°",0,0);
  resetMatrix();
  translate(970+900*cos(radians(0)),1000-900*sin(radians(0)));
  rotate(radians(0));
  text("0°", 0, 0);
  resetMatrix();
  translate(900+900*cos(radians(180)),1000-900*sin(radians(180)));
  rotate(radians(0));
  text("180°",0,0);
  popMatrix(); 
}
