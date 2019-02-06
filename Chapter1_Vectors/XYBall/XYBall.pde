/*PVector is going to store Components of a vector*/
/*Instead of "float x;　float y";
State like "PVector location";
Instead of "x = 100; y = 50;";
Store value like "location = new PVector(100, 50);"*/

Ball b1;
Ball b2;
Ball b3;


void setup(){
  size(960,540);
  b1 = new Ball(25, mouseX, mouseY-72);
  b2 = new Ball(20, mouseX-50, mouseY-50);
  b3 = new Ball(20, mouseX+50, mouseY-50);
}

void draw(){
  background(255);
  b1.displayUmeda();
  b1.moveUmeda();
  b2.displayUmeda();
  b2.moveUmeda();
  b3.displayUmeda();
  b3.moveUmeda();
  //b.checkUmeda();
  
  if(b1.overlaps(b2)){
    b2.Ballx = b2.Ballx - 
  }
}
