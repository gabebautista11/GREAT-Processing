void setup(){
   size(1000, 1000);
   background(0);
   //noStroke();
   
   //fractal2(500, 500, 1000);
   fractal(500, 500, 500);
}

void fractal(float x, float y, float radius){
  if(radius < 2){
     return; 
  }
  ellipse(x, y, radius, radius);
  fractal(x + radius/2, y + radius/2, radius/2);
  fractal(x - radius/2, y + radius/2, radius/2);
  fractal(x + radius/2, y - radius/2, radius/2);
  fractal(x - radius/2, y - radius/2, radius/2);
}

void fractal2(float x, float y, float size){
  if(size > 2){
    ellipse(x, y, size, size);
    fractal2(x + size/4, y, size/2);
    fractal2(x - size/4, y, size/2);
  }
}
