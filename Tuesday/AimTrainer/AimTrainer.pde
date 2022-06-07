float x;
float y;
int score;
float timer;
int counter;

void setup() {
 counter = 0;
  score = 0;
  size(900, 900);
  background(0);
  x = random(900 - 25) + 25;
  y = random(900 - 25) + 25;
  ellipse(x, y, 50, 50);
}

void draw() {
  background(0);
  text("Score: " + score, 15, 25);
  textSize(36);
  ellipse(x, y, 50, 50);
  
  if(counter >= 5){
    text("Your time was: " + timer / 1000, 350, 350);
    
  }
}

void mousePressed() {
  //mouseX, mouseY
  float xDistance = mouseX - x;
  float yDistance = mouseY - y;
  float distance = sqrt(pow(yDistance, 2) + pow(xDistance, 2));
  if (distance <= 25) {
    counter++;
    score += 1;
    println(counter);
    if(counter == 5){
       timer = millis();
    }
    
    
  
  } else {
    score -= 5;
  }


  x = random(900 - 25) + 25;
  y = random(900 - 25) + 25;
}
