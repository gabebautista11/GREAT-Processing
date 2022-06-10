import processing.video.*;

Capture cam;
int leftX;
int leftY;
int rightX;
int rightY;
int conuter;
int ballXVelocity;
int ballYVelocity;
int ballX;
int ballY;



void setup() {
  size(640, 480);
  conuter = 0;
 
  ballXVelocity = -1;
  ballYVelocity = int(random(0,1));
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


ballX = cam.width / 2;
  ballY = cam.height / 2;
    cam.start();
  }
}


// Light tracking
void draw() {
  if (cam.available()) {
    fill(150);
    cam.read();
    cam.loadPixels();


    scanLeftArea();

    scanRightArea();



    cam.updatePixels();
  }


  image(cam, 0, 0);
  fill(#FF0000);
  ellipse(leftX, leftY, 20, 20);// draws circle where brightpixel is
  ellipse(rightX, rightY, 20, 20);// draws circle where brightpixel is

  noFill();
  strokeWeight(5);
  rect(2.5, 0, cam.width / 4, cam.height); //left region
  rect(cam.width - 2.5, 0, -cam.width / 4, cam.height); //right region

  fill(120);
  drawBall();
  collisionDection();
  drawPaddle(rightX);
  drawPaddle(leftX);
}


void scanLeftArea() {
  for (int firstColIndex = 0; firstColIndex < 306560; firstColIndex+=640) { //loops through the left side
    for (int index = firstColIndex; index < firstColIndex + 160; index++) {
      if (cam.pixels[index] < color(20, 20, 20)) {
        leftX = index % cam.width;
        leftY = index / cam.width;
      }
    }
  }
}

void scanRightArea() {
  for (int firstColIndex = cam.width - 160; firstColIndex < 307040; firstColIndex+= cam.width) { //loops through the left side
    for (int index = firstColIndex; index < firstColIndex + 160; index++) {
      if (cam.pixels[index] < color(20, 20, 20)) {

        //println("found black in right area" + conuter++);
        rightX = index % cam.width;
        rightY = index / cam.width;
      }
    }
  }
}

void drawPaddle(int x) {

  if (x > cam.width / 2) { //paddle is on right side
    rect(width - 30, rightY, 20.0, 75.0);
  } else {  //paddle is on left side
    rect(30, leftY, 20.0, 75.0);
    println("drawing left paddle at " + 30 + "" + leftY);
  }
}

void drawBall(){
  ellipse(ballX, ballY, 20, 20);
  ballX += ballXVelocity;
  ballY += ballYVelocity;
}

void collisionDection(){
  if(ballX <= 30 && (ballY < leftY && ballY > leftY + 75)) //hits left paddle
  {
    ballXVelocity *= -1;
   println("hits left paddle"); 
  }
  
  if(ballX >= cam.width - 30 && (ballY < rightY && ballY > rightY + 75)) //hits left paddle
  {
    ballXVelocity *= -1;
   println("hits left paddle"); 
  }
  
  
  
}
