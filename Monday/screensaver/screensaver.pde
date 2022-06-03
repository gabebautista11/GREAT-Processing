String word;
int xPos;
int yPos;
int xSpeed;
int ySpeed;

void setup(){
  size(1920, 1080);
  Text t = new Text();
}

void draw(){
  background(0);
  text(word, xPos, yPos);
  textAlign(CENTER);
  xPos += xSpeed;
  yPos += ySpeed;
  
}

class Text
{
  float textSize;
  String text;
  int fontSize;
  int Xpos;
  int yPos;
  int ySpeed;
  int xSpeed;
  
  Text(){
    fontSize = 64;
    xPos = 400;
    yPos = 400;
    text = "Welcome to Processing";
    xSpeed = 2;
    ySpeed = 2;
  }
  
  void move(){
    if(xPos > 1920)
      xSpeed = -2;
    
    if(xPos < 1920)
      xSpeed = 2;
      
    if(yPos > 1080){
      ySpeed = -2;
    }
  
  
}
