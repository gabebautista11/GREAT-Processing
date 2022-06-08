Text t;

void setup() {
  size(1920, 1080);
  t = new Text();
}

void draw() {
  background(0);
  t.move();
}

class Text
{
  float textSize;
  String text;
  int fontSize;
  int xPos;
  int yPos;
  int ySpeed;
  int xSpeed;
  int speed = 4;


  Text() {
    fontSize = 64;
    textSize(fontSize);
    xPos = 400;
    yPos = 400;
    text = "Welcome to Processing";
    xSpeed = speed;
    ySpeed = speed;
  }

  void move() {

    xPos += xSpeed;
    yPos += ySpeed;

    if (xPos > 1920 - 300) {
      fill(random(255), random(255), random(255));
      xSpeed = -speed;
    } else if (xPos < 0) {
      fill(random(255), random(255), random(255));

      xSpeed = speed;
    }

    if (yPos > 1080 - 250) {
      fill(random(255), random(255), random(255));

      ySpeed = -speed;
    }

    if (yPos < 0 ) {
      fill(random(255), random(255), random(255));

      ySpeed = speed;
    }



    text(text, xPos, yPos, 500, 500);
  }
}
