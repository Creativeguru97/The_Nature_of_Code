/*PVector is going to store Components of a vector*/
/*Instead of "float x;　float y";
State like "PVector location";
Instead of "x = 100; y = 50;";
Store value like "location = new PVector(100, 50);"*/

Ball b;


void setup(){
  size(960,540);
  b = new Ball();
}

void draw(){
  background(255);
  b.displayUmeda();
  b.moveUmeda();
  b.checkUmeda();
}
