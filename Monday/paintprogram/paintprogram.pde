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
}

void mousePressed(){
  ellipse(mouseX, mouseY, 10, 10);
}
