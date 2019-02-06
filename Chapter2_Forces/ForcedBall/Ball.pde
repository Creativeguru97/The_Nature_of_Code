
class Ball{
  PVector location;
  //float x;
  //float y;
  
  PVector velocity;
  //float Xspeed; 
  //float Yspeed;
  
   PVector acceleration;
  
  Ball(){
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    //x=random(5,width);
    //y=random(3,height);
    //Xspeed=5;
    //Yspeed=5;
    
  }
  
  //Newton's second Law! (the beginning)
  void applyForce(PVector force){
    acceleration.add(force);
  }
  
  void displayUmeda(){
  ellipse(location.x,location.y,48,48);
  }
  
  void moveUmeda(){
    
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
  
  void checkUmeda(){
   //Accelerate objectX
    if(location.x > width-24 || location.x < 24){
      velocity.x = velocity.x*-1;
      acceleration.x = acceleration.x*-1;
    }
    
    if(location.y>height-24 || location.y<24){
      velocity.y=velocity.y*-1;
      acceleration.y = acceleration.y*-1;
    }
  }
}
