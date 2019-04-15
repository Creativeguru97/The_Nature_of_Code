//float amplitude = 320;//range of the oscilating move
//float period = 60;
float angle = PI/6;
float aVel = 0;
float aAcc = 0;

float l;
PVector origin;
PVector bob;

//float aVel = 0;
//float aAcc = 0.001;


void setup(){
  size(640, 360);
  l = 180;
  origin = new PVector(width/2, 0);
  bob = new PVector(width/2, l);
}

void draw(){
  background(0);
  bob.x = origin.x + l * sin(angle);
  bob.y = origin.y + l * cos(angle);
  
  fill(255);
  stroke(255);
  line(origin.x, origin.y, bob.x, bob.y);
  ellipse(bob.x, bob.y, 50, 50);
  
  aAcc = -0.01 * sin(angle);
  angle += aVel;
  aVel += aAcc;
  
  aVel *= 0.99;
  
  println(angle);
  
  
}
