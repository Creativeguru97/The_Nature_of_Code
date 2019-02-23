/*PVector is going to store Components of a vector*/
/*Instead of "float x;　float y";
State like "PVector location";
Instead of "x = 100; y = 50;";
Store value like "location = new PVector(100, 50);"*/

//Net force : accumulate multiple forces into acceleration

Ball[] balls;


void setup(){
  size(960,540);
  balls = new Ball[5];
  for(int i=0; i<balls.length; i++){
    balls[i] = new Ball();
  }
}

void draw(){
  background(255);
  
  /*Enhanced loop!!!
  For every Ball b in the array balls, do this to it*/
  for(Ball b : balls){
  PVector gravity = new PVector(0,0.1);
  gravity.mult(b.mass);
  b.applyGravity(gravity);
  
  if(mousePressed){
    PVector wind = new PVector(0.1,0);
    b.applyGravity(wind);
  }
  
  b.displayUmeda();
  b.moveUmeda();
  b.checkUmeda();
  }
}
