/*PVector is going to store Components of a vector*/
/*Instead of "float x;　float y";
State like "PVector location";
Instead of "x = 100; y = 50;";
Store value like "location = new PVector(100, 50);"*/

//Net force : accumulate multiple forces into acceleration

Ball b;


void setup(){
  size(960,540);
  b = new Ball();
}

void draw(){
  background(255);
  
  PVector force = new PVector(0,0.1);
  b.applyForce(force);
  
  if(mousePressed){
    PVector wind = new PVector(0.1,0);
    b.applyForce(wind);
  }
  
  b.displayUmeda();
  b.moveUmeda();
  b.checkUmeda();
}
