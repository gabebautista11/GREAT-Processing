int iteration;

void setup(){
   size(1000, 1000);
   background(0);
   //noStroke();
   iteration = 0;
   //fractal2(500, 500, 1000);
   fractal(500, 500, 500, iteration);
}

void fractal(float x, float y, float radius, int iteration){
  if(radius < 2){
     return; 
  }
  fill(iteration, iteration, iteration, iteration);
  ellipse(x, y, radius, radius);
  fractal(x + radius/2, y + radius/2, radius/2, iteration+= 10);
  fractal(x - radius/2, y + radius/2, radius/2,  iteration+= 10);
  fractal(x + radius/2, y - radius/2, radius/2, iteration+= 10);
  fractal(x - radius/2, y - radius/2, radius/2, iteration+= 10);
}

void fractal2(float x, float y, float size){
  if(size > 2){
    ellipse(x, y, size, size);
    fractal2(x + size/4, y, size/2);
    fractal2(x - size/4, y, size/2);
  }
}
