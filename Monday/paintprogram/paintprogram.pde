int shapeNumber = 1;

void setup(){
  size(500,500);
  background(0);
}

void draw(){
  
}

void keyPressed(){
  if(key == 'r'){
     fill(255,0,0); 
  }
  else if(key == 'b'){
    fill(0,0,255);
  }
  else if(key == 'g'){
    fill(0,255,0);
  }
  else if(key == '1'){
    shapeNumber = 1;
  }
  else if(key == '2'){
    shapeNumber = 2;
  }
  else if(key == '3'){
    shapeNumber = 3;
  }
}

void mousePressed(){
  if(shapeNumber == 1){
    ellipse(mouseX, mouseY, 10, 10);
  }
  else if(shapeNumber == 2){
    rect(mouseX, mouseY, 10, 10);
  }
  else{
    triangle(mouseX, mouseY, mouseX + 10, mouseY, mouseX, mouseY + 10);
  }
}
