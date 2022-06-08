ArrayList<Float> xCoords = new ArrayList<Float>();
ArrayList<Float> yCoords = new ArrayList<Float>();

void setup(){
  size(700, 700);
  background(0);
  fill(0,255,0);
  
  for(int i = 0; i < 10; i++){
     xCoords.add(i, new Float(mouseX)); 
     yCoords.add(i, new Float(mouseY)); 
  }
  
  
}

void draw(){
  background(0);
  for(int i = 0; i < 10; i++){
      ellipse(xCoords.get(i), yCoords.get(i), 20, 20);
  }
}

void mouseMoved(){
  xCoords.remove(0);
  yCoords.remove(0);
  xCoords.add(9, new Float(mouseX));
  yCoords.add(9, new Float(mouseY));
}
