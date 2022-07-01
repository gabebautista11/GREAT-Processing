import processing.video.*; 
Capture cam;


void setup() {
  size(640, 480);
  cam = new Capture(this, 640, 480, 30);
  cam.start();
   noStroke();
  
}

void draw() {
  if (cam.available()) 
  {
    cam.read(); 
    //image(cam, 0, 0);
    for (int y = 0; y < height; y+= 5) {    
      for (int x = 0; x < width; x += 5) {
        color c = cam.get(x,y);
        fill(c); 
        rect(x + random(x / 10), y + random(y / 10), 5, 5);
      }
    }
  }
}