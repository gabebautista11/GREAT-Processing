float input;

void setup(){
  size(500, 500);
  input = 0;
}

void draw(){
  delay(10);
  background(0);
  input += 0.02;
  float diameter = 480*sin(input);
  if(abs(diameter) < 5){
     fill(random(255), random(255), random(255));
  }
  circle(250, 250, diameter);
}
