float r = 320;
float a = PI/2;
float period = 60;

float aVel = 0;
float aAcc = 0.001;


void setup(){
  size(640, 360);
}

void draw(){
  background(0);
  translate(width/2, height/2);
  //float x = r*cos(a);
  //float y = r*sin(a);
  float x = r*cos((frameCount/period) * TWO_PI);
  float y = r*sin((frameCount/period) * TWO_PI);
  //when xfps, if we set period = 2x, 2PI/s in result. 
  fill(255);
  stroke(255);
  line(0, 0, x, y);
  ellipse(x, y, 50, 50);
  
  a += aVel;
  aVel += aAcc;
  aVel = constrain(aVel, 0, 0.2);

}
