void setup(){
  // background
  size(700,700);
  smooth();
  
  // body
  //noStroke();
  circle(350, 450, 300); // bottom
  circle(350, 325, 250); // middle
  circle(350, 200, 180); // top
  
  // nose
  fill(204, 102, 0);
  triangle(350, 195, 350, 205, 400, 200);
  
  // eyes
  fill(0, 0, 0);
  int eyeOffset = 25;
  int eyeHeight = 175;
  circle(350 + eyeOffset, eyeHeight, 10);
  circle(350 - eyeOffset, eyeHeight, 10);
  
  // buttons
  int buttonSpacing = 30;
  int centerButtonHeight = 350;
  circle(350, centerButtonHeight + buttonSpacing,  7);
  circle(350, centerButtonHeight,  7);
  circle(350, centerButtonHeight - buttonSpacing,  7);
  
  // arms
  stroke(165,42,42);
  strokeWeight(5);
  int armWidth = 50;
  int armHeight = 20;
  line(320, 350, 320 + armWidth, 350 + armHeight);
  
  
}

void draw(){
  
}
