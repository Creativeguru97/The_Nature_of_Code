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
  fill(100);
  rect(0, height/2, width, height/2);
  
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
  
  ////Friction
  //PVector friction = b.velocity.get();
  //friction.normalize();
  ////or, just like "float c = -0.01;"
  //friction.mult(-1);
  //float c = 0.02;
  //friction.mult(c);
  //b.applyGravity(friction);
  
  //Water or gas resistance
  if(b.location.y >= height/2){
      PVector Resistance = b.velocity.get();
      Resistance.normalize();
      Resistance.mult(-1);
      float c2 = 0.1;
      float speed = b.velocity.magSq();
      //We gain squared value
      
      Resistance.mult(c2 * speed);
      b.applyGravity(Resistance);   
  }
  
  b.displayUmeda();
  b.moveUmeda();
  b.checkUmeda();
  }
}
