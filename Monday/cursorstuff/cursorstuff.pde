PImage potato;

void setup(){
  size(1000, 1000);
  potato = loadImage("potato.jpg");
  image(potato, 0, 0);
}

void draw(){
  background(0);
  image(potato, mouseX, mouseY);
}
