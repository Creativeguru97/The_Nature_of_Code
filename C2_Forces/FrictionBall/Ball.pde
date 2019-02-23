
class Ball{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass; // This time, this value affect the radius.
  
  Ball(){
    
    location = new PVector(random(25, width-25), height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = random(1, 3);

  }
  
  //Newton's second Law! (the beginning)
  void applyGravity(PVector gravity){
    PVector f = PVector.div(gravity, mass);
    acceleration.add(f);
  }
  
  void displayUmeda(){
  ellipse(location.x, location.y, mass*20, mass*20);
  }
  
  void moveBalls(){
    
    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(location);
    
    /*By this setMag();, we restrict the amount(scale) of acceleration*/
    /*if setMag(0.5);, acceleration increase 0.5 every frame*/
    mouse.setMag(0.5);
    //acceleration = mouse;
    //acceleration = PVector.random2D();

    velocity.add(acceleration);
    //like: location = location + velocity
    location.add(velocity);
    acceleration.mult(0);
    //x=x+Xspeed;
    //y=y+Yspeed;
    velocity.limit(10);
  }
  
  void checkBalls(){
   //Accelerate objectX
    if(location.x > width-mass*20/2){
      location.x = width-mass*20/2;
      velocity.x = velocity.x*-1;
      //acceleration.x = acceleration.x*-1;
    }
    if(location.x < mass*20/2){
      location.x = mass*20/2;
      velocity.x = velocity.x*-1;
      //acceleration.x = acceleration.x*-1;
    }
    
    if(location.y > height-mass*20/2){
      location.y = height-mass*20/2;
      velocity.y=velocity.y*-1;
      //acceleration.y = acceleration.y*-1;
    }
    if(location.y < mass*20/2){
      location.y = mass*20/2;
      velocity.y=velocity.y*-1;
      //acceleration.y = acceleration.y*-1;
    }
  }
}
