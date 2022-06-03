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
    xSpeed = 2;
    ySpeed = 2;
  }

  void move() {
    xPos += xSpeed;
    yPos += ySpeed;

    if (xPos > 1920 - 300)
      xSpeed = -2;

    else if (xPos < 0)
      xSpeed = 2;

    if (yPos > 1080 - 250)
      ySpeed = -2;

    if (yPos < 0 )
      ySpeed = 2;



    text(text, xPos, yPos, 500, 500);
  }
}
