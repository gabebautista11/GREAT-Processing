import processing.video.*;

Capture cam;
int x;
int y;



void setup() {
  size(640, 480);

  String[] cameras = Capture.list();

  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    setup();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }

    // The camera can be initialized directly using an
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();
  }
}


// Light tracking
void draw() {
  if (cam.available()) {
    cam.read();
    cam.loadPixels();
    scanLeftArea();
    scanRightArea();
    cam.updatePixels();
    /**
     float maxBri = 0;
     int theBrightPixel = 0;
     for(int i=0; i<cam.pixels.length; i++) {
     if(brightness(cam.pixels[i]) > maxBri) {
     maxBri = brightness(cam.pixels[i]);
     theBrightPixel = i;
     }
     }
     x = theBrightPixel % cam.width;
     y = theBrightPixel / cam.width;
     **/
  }

  image(cam, 0, 0);
  fill(#FF0000);
  ellipse(x, y, 20, 20);// draws circle where brightpixel is
  noFill();
  strokeWeight(5);
  rect(2.5, 0, cam.width / 4, cam.height); //left region
  rect(cam.width - 2.5, 0, -cam.width / 4, cam.height); //right region
}


void scanLeftArea(){
  for (int firstColIndex = 0; firstColIndex < 306560; firstColIndex+=640) { //loops through the left side
      for (int index = firstColIndex; index < firstColIndex + 160; index++) {
          cam.pixels[index] = color(random(255), random(255), random(255));
        if (firstColIndex > 306560)
          break;
      }
    }
  
}

void scanRightArea(){
  for (int firstColIndex = cam.width - 160; firstColIndex < 306560 + cam.width - 160; firstColIndex+= cam.width - 160) { //loops through the left side
      for (int index = firstColIndex; index < firstColIndex + 160; index++) {
                    cam.pixels[index] = color(random(255), random(255), random(255));

        if (firstColIndex > 306560 + cam.width - 160)
          break;
      }
    }
  
}
