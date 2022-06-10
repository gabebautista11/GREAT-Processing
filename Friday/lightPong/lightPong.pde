import processing.video.*;

Capture cam;
int leftX;
int leftY;
int rightX;
int rightY;
int conuter;
int ballXVelocity;
float ballYVelocity;
int ballX;
int ballY;
int leftPlayerScore;
int rightPlayerScore;



void setup() {
  size(640, 480);
  conuter = 0;
  leftPlayerScore = 0;
  rightPlayerScore = 0;
  ballXVelocity = -1;
  ballYVelocity = random(1, 1.5);
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
  drawPlayerScore();
}


void scanLeftArea() {
  for (int firstColIndex = 0; firstColIndex < 306560; firstColIndex+=640) { //loops through the left side
    for (int index = firstColIndex; index < firstColIndex + 160; index++) {
      if (cam.pixels[index] < color(50, 50, 50)) {
        leftX = index % cam.width;
        leftY = index / cam.width;
      }
    }
  }
}

void scanRightArea() {
  for (int firstColIndex = cam.width - 160; firstColIndex < 307040; firstColIndex+= cam.width) { //loops through the left side
    for (int index = firstColIndex; index < firstColIndex + 160; index++) {
      if (cam.pixels[index] < color(50, 50, 50)) {

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

void drawBall() {
  ellipse(ballX, ballY, 20, 20);
  ballX += ballXVelocity;
  ballY += ballYVelocity;
}

void collisionDection() {
  if (ballX <= 50 && (ballY > leftY && ballY < leftY + 75)) //hits left paddle
  {
    ballXVelocity *= -1;
    println("hits left paddle");
  }

  if (ballY >= cam.height) {
    ballYVelocity *= -1;
  }
  if (ballY <= 0) {
    ballYVelocity *= -1;
  }

  if (ballX >= cam.width - 50 && (ballY > rightY && ballY < rightY + 75)) //hits left paddle
  {
    ballXVelocity *= -1;
    println("hits left paddle");
  }
  
  
  if(ballX < 0){
   rightPlayerScore++; 
   ballX = cam.width / 2;
  ballY = cam.height / 2;
  }
  if(ballX > cam.width){
   leftPlayerScore++; 
   ballX = cam.width / 2;
  ballY = cam.height / 2;
  }
}

void drawPlayerScore(){
  textSize(24);
  fill(0);
  text("Player 1: " + leftPlayerScore, 25, 25); //left player
  text("Player 2: " + rightPlayerScore, cam.width - 160, 25); //right player
  
}
