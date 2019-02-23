/*PVector is going to store Components of a vector*/
/*Instead of "float x;　float y";
State like "PVector location";
Instead of "x = 100; y = 50;";
Store value like "location = new PVector(100, 50);"*/

//Net force : accumulate multiple forces into acceleration

Ball[] balls;
Liquid liquid;

void setup(){
  size(960,540);
  
  balls = new Ball[5];
  for(int i=0; i<balls.length; i++){
    balls[i] = new Ball();
  }
  
  liquid = new Liquid(0, height/2, width, height/2);
}

void draw(){
  background(255);
  fill(100);
  rect(0, height/2, width, height/2);

  /*Enhanced loop!!!
  For every Ball b in the array balls, do this to it*/
  for(int i = 0; i < balls.length; i++){
    
    if(liquid.contains(balls[i])){
      PVector ResistanceF = liquid.Resistance(balls[i]);
      balls[i].applyGravity(ResistanceF);
    }
    
  PVector gravity = new PVector(0,0.1);
  gravity.mult(balls[i].mass);
  balls[i].applyGravity(gravity);
  
  if(mousePressed){
    PVector wind = new PVector(0.1,0);
    balls[i].applyGravity(wind);
  }
  
  ////Friction
  //PVector friction = b.velocity.get();
  //friction.normalize();
  ////or, just like "float c = -0.01;"
  //friction.mult(-1);
  //float c = 0.02;
  //friction.mult(c);
  //b.applyGravity(friction);
  
  balls[i].displayUmeda();
  balls[i].moveUmeda();
  balls[i].checkUmeda();
  }
}
