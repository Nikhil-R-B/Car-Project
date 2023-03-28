//import processing.pdf.*;

/*size(500, 500);
background(0, 255, 0);
stroke(255, 0, 0);
line(150, 25, 270, 350);
line(15, 25, 70, 90);*/

/*void setup() {
  size(500, 500);
  stroke(255, 0, 0);
  background(0, 0, 255);
} 

void draw() {
  line(0, 0, mouseX, mouseY);
}*/

/*void setup() {
  size(500, 500);
  stroke(255, 0, 0);
} 

void draw() {
  background(0, 0, 255);
  line(0, 0, mouseX, mouseY);
}*/

/*void setup() {
  size(500, 500, P2D);
  stroke(255, 0, 0);
} 

void draw() {
  beginRecord(PDF, "lines.pdf"); //creates a pdf called lines and writes to it using line() and ellipse().
  line(0, 0, mouseX, mouseY);
  saveFrame("output.png");
}

void mousePressed() {
  background(0, 0, 255);
}*/

/*Always the middle, no matter how the size() line changes
ellipse(width/2, height/2, 50, 50);*/

/*Examples of loading a text file and a JPEG image
from the data folder of a sketch.
String[] lines = loadStrings("something.txt");
PImage image = loadImage("picture.jpg");*/

/*size (500, 500);
background(255, 255, 255);
String message = "some text here.";
char c = message.charAt(3);
println(c);                // Results in 'e'
String message = "This String is 34 characters long.";
println(message.length());
String uppercase = message.toUpperCase();
println(uppercase);
String one = "hello";
String two = "hello";
println(one.equals(two));
String helloworld = "Hello" + "World";
int x = 10;
String message = "The value of x is: " + x;
println(mouseX); //For position of mouse
PFont f; //Object of type PFont
f = createFont("Arial",16,true); // Arial, 16 point, anti-aliasing on. Done in setup
textFont(f,36);
fill(255, 0, 0); //For colour
f = loadFont("ArialMT-16.vlw");*/

/*PFont f;                           // STEP 1 Declare PFont variable
  
void setup() {
  size(500,500);
  f = createFont("Arial",16,true); // STEP 2 Create Font
}

void draw() {
  background(255, 255, 255);
  textFont(f,56);                  // STEP 3 Specify font to be used
  fill(0, 0, 0);                         // STEP 4 Specify font color 
  text("Hello Strings!",10,100);   // STEP 5 Display Text
}*/

/*PFont f;

void setup() {
  size(500,500);
  f = createFont("Arial",16,true); 
}

void draw() {
  background(255);

  stroke(175);
  line(width/2,0,width/2,height);

  textFont(f);       
  fill(0);

  textAlign(CENTER);
  text("This text is centered.",width/2,60); 

  textAlign(LEFT);
  text("This text is left aligned.",width/2,100); 

  textAlign(RIGHT);
  text("This text is right aligned.",width/2,200); 
}*/

/*//Example Scrolling Headlines
//An array of news headlines

String[] headlines = {
  "Processing downloads break downloading record.", 
  "New study shows computer programming lowers cholesterol.",
  "POG"
  };

PFont f;  // Global font variable
float x;  // horizontal location of headline
int index = 0;

void setup() {
  size(400,200);
  f = createFont("Arial",16,true);  
  // Initialize headline offscreen to the right 
  x = width; 
}

void draw() {
  background(255);
  fill(0);

  // Display headline at x  location
  textFont(f,16);        
  textAlign(LEFT);
  text(headlines[index],x,180); 

  // Decrement x
  x = x - 1.75;

  // If x is less than the negative width, 
  // then it is off the screen
  float w = textWidth(headlines[index]);
  if (x < -w) {
    x = width; 
    index = (index + 1) % headlines.length;
  }
}*/

/*//Example: Rotating Text
PFont f;
String message = "this text is spinning";
float theta;

void setup() {
  size(500, 500);
  f = createFont("Arial",20,true);
}

void draw() { 
  background(255);
  fill(0);
  textFont(f);                  // Set the font
  translate(width/2,height/2);  // Translate to the center
  rotate(theta);                // Rotate by theta
  textAlign(CENTER);            
  text(message,0,0);            
  theta += 0.035;                // Increase rotation
}*/

/*PFont f;
String message = "Each character is written individually.";

void setup() {
  size(400, 150);
  f = createFont("Arial",20,true);
}

void draw() { 
  background(255);
  fill(0);
  textFont(f);         
  int x = 10;
  for (int i = 0; i < message.length(); i++) {
    textSize(random(12,36));
    text(message.charAt(i),x,height/2);
    // textWidth() spaces the characters out properly.
    x += textWidth(message.charAt(i)); 
  }
  noLoop();
}*/

/*//Example Text breaking up
PFont f;
String message = "click mouse to shake it up";
// An array of Letter objects
Letter[] letters;

void setup() {
  size(260, 200);
  // Load the font
  f = createFont("Arial",20,true);
  textFont(f);
  
  // Create the array the same size as the String
  letters = new Letter[message.length()];
  // Initialize Letters at the correct x location
  int x = 16;
  for (int i = 0; i < message.length(); i++) {
    letters[i] = new Letter(x,100,message.charAt(i)); 
    x += textWidth(message.charAt(i));
  }
}

void draw() { 
  background(255);
  for (int i = 0; i < letters.length; i++) {
    // Display all letters
    letters[i].display();
    
    // If the mouse is pressed the letters shake
    // If not, they return to their original location
    if (mousePressed) {
      letters[i].shake();
    } else {
      letters[i].home();
    }
  }
}

// A class to describe a single Letter
class Letter {
  char letter;
  // The object knows its original "home" location
  float homex,homey;
  // As well as its current location
  float x,y;

  Letter (float x_, float y_, char letter_) {
    homex = x = x_;
    homey = y = y_;
    letter = letter_; 
  }

  // Display the letter
  void display() {
    fill(0);
    textAlign(LEFT);
    text(letter,x,y);
  }

  // Move the letter randomly
  void shake() {
    x += random(-2,2);
    y += random(-2,2);
  }

  // Return the letter home
  void home() {
    x = homex;
    y = homey; 
  }
}*/

/*//Example Boxes along a curve

PFont f;
// The radius of a circle
float r = 100;
// The width and height of the boxes
float w = 40;
float h = 40;

void setup() {
  size(320, 320);
  smooth();
}

void draw() {
  background(255);
  
  // Start in the center and draw the circle
  translate(width / 2, height / 2);
  noFill();
  stroke(0);
  // Our curve is a circle with radius r in the center of the window.
  ellipse(0, 0, r*2, r*2);

  // 10 boxes along the curve
  int totalBoxes = 15;
  // We must keep track of our position along the curve
  float arclength = 0;
  
  // For every box
  for (int i = 0; i < totalBoxes; i++) {
    // Each box is centered so we move half the width
    arclength += w/2;
    // Angle in radians is the arclength divided by the radius
    float theta = arclength / r;     
    
    pushMatrix();
    // Polar to cartesian coordinate conversion
    translate(r*cos(theta), r*sin(theta));
    // Rotate the box
    rotate(theta);
    // Display the box
    fill(0,100);
    rectMode(CENTER);
    rect(0,0,w,h);  
    popMatrix();
    // Move halfway again
    arclength += w/2;
  }
}*/

/*//Example Characters along a curve
// The message to be displayed
String message = "Text along a curve";

PFont f;
// The radius of a circle
float r = 100;

void setup() {
  size(320, 320);
  f = createFont("Georgia",40,true);
  textFont(f);
  // The text must be centered!
  textAlign(CENTER);
  smooth();
}

void draw() {
  background(255);

  // Start in the center and draw the circle
  translate(width / 2, height / 2);
  noFill();
  stroke(0);
  ellipse(0, 0, r*2, r*2);

  // We must keep track of our position along the curve
  float arclength = 0;

  // For every box
  for (int i = 0; i < message.length(); i++)
  {
    // Instead of a constant width, we check the width of each character.
    char currentChar = message.charAt(i);
    float w = textWidth(currentChar);

    // Each box is centered so we move half the width
    arclength += w/2;
    // Angle in radians is the arclength divided by the radius
    // Starting on the left side of the circle by adding PI
    float theta = PI + arclength / r;    

    pushMatrix();
    // Polar to cartesian coordinate conversion
    translate(r*cos(theta), r*sin(theta));
    // Rotate the box
    rotate(theta+PI/2); // rotation is offset by 90 degrees
    // Display the character
    fill(0);
    text(currentChar,0,0);
    popMatrix();
    // Move halfway again
    arclength += w/2;
  }
}*/
