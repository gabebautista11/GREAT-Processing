/**
 * Iteration. 
 * 
 * Iteration with a "for" structure to construct repetitive forms. 
 */
 
int y;
int num = 14;

size(640, 360);
background(102);
noStroke();
 
// White bars 
fill(255);
y = 60;
for(int i = 0; i < num/3; i++) {
  rect(50, y, 475, 10);
  y+=20;
}
/*
//animation test
*/


void setup(){
  
}

void draw(){
  
}

class Frame{
  int x;
  int y;
  String shape;
  int shapeWidth;
  int shapeHeight;
 
  Frame(int x, int y, String shape, int shapeWidth, int shapeHeight){
   this.x = x;
   this.y = y;
   this.shape = shape;
   this.shapeWidth = shapeWidth;
   this.shapeHeight = shapeHeight;
 }
  
  
}
