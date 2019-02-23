float amplitude = 320;//range of the oscilating move
float period = 60;
float angle = 0;

float aVel = 0;
float aAcc = 0.001;


void setup(){
  size(640, 360);
}

void draw(){
  background(0);
  translate(width/2, height/2);
  float x = width/2 * sin(angle);
  //float x = width/2 * sin((frameCount/period) * TWO_PI);
  //when xfps, if we set period = 2x, 2PI/s in result. 
  
  fill(255);
  stroke(255);
  line(0, 0, x, 0);
  ellipse(x, 0, 50, 50);
  
  angle += 0.2;

}
