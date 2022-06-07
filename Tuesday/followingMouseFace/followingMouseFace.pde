void setup(){
  size(1920,1080);
}

void draw(){
  background(0,0,0); //black background
  fill(255,255,255); //white
  ellipse(mouseX - 50, mouseY - 5, 50, 50); //left eyeball
  fill(0,0,0); //black
  ellipse(mouseX - 50, mouseY -5, 25, 25); //left pupil
  fill(225,255,255); //white
  ellipse(mouseX + 50, mouseY - 5, 50, 50); //right eyeball
  fill(0,0,0); //black
  ellipse(mouseX + 50, mouseY -5, 25, 25); //right pupil
  fill(255,255,255); //white
  ellipse(mouseX, mouseY + 40, 20, 20); //mouth
}
