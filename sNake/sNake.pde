ArrayList<Float> xCoords = new ArrayList<Float>();
ArrayList<Float> yCoords = new ArrayList<Float>();

int snakeSize = 100;

void setup(){
  size(700, 700);
  background(0);
  fill(0,255,0);
  noStroke();
  
  for(int i = 0; i < snakeSize; i++){
     xCoords.add(i, (float)mouseX); 
     yCoords.add(i, (float)mouseY); 
  }
  
  
}

void draw(){
  background(0);
  for(int i = 0; i < snakeSize; i++){
      ellipse(xCoords.get(i), yCoords.get(i), 20, 20);
  }
}

void mouseMoved(){
  xCoords.remove(0);
  yCoords.remove(0);
  xCoords.add(snakeSize - 1, (float)mouseX);
  yCoords.add(snakeSize - 1, (float)mouseY);
}
