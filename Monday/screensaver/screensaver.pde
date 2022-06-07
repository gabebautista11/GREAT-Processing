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


  Text() {
    fontSize = 64;
    textSize(fontSize);
    xPos = 400;
    yPos = 400;
    text = "Welcome to Processing";
    xSpeed = 200;
    ySpeed = 200;
  }

  void move() {
    background(random(255), random(255), random(255));

    xPos += xSpeed;
    yPos += ySpeed;

    if (xPos > 1920 - 300) {
      fill(random(255), random(255), random(255));
      xSpeed = -200;
    } else if (xPos < 0) {
      fill(random(255), random(255), random(255));

      xSpeed = 200;
    }

    if (yPos > 1080 - 250) {
      fill(random(255), random(255), random(255));

      ySpeed = -200;
    }

    if (yPos < 0 ) {
      fill(random(255), random(255), random(255));

      ySpeed = 200;
    }



    text(text, xPos, yPos, 500, 500);
  }
}
