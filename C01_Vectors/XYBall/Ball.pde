class Ball{
  //PVector location;
  float Ballx, Bally;
  
  //PVector velocity;
  float Xspeed, Yspeed;
  
   //PVector acceleration;
   float AccelerationX, AccelerationY;
   
   int diameter;
  
  Ball(int EachDiameter, float EachBallX, float EachBallY){
    //location = new PVector(width/2, height/2);
    Ballx = EachBallX;
    Bally = EachBallY;
    
    diameter = EachDiameter;
    
    //velocity = new PVector(0, 0);
    Xspeed=0;
    Yspeed=0;
    //acceleration = new PVector(0, 0);
    AccelerationX=0;
    AccelerationY=0;
  }
  
  void displayUmeda(){
  ellipse(Ballx, Bally, diameter, diameter);
  }
  
  void moveUmeda(){
    //PVector mouse = new PVector(mouseX, mouseY);
    //mouse.sub(location);
    //mouse.setMag(0.5);
    //acceleration = mouse;
    //velocity.add(acceleration);
    //like: location = location + velocity
    //location.add(velocity);
    //x=x+Xspeed;
    //y=y+Yspeed;
    //velocity.limit(10);
    
    float MouseX = mouseX;
    float MouseY = mouseY;
    
    float d = dist(MouseX, MouseY-72, Ballx, Bally);
    Xspeed = d;
    Yspeed = d;
    
    if(MouseX > Ballx){
    Ballx = Ballx + Xspeed/20;
    }
    if(MouseX < Ballx){
    Ballx = Ballx - Xspeed/20;
    }
    if(MouseX == Ballx){
    Xspeed = 0;
    }
    if(MouseY-72 > Bally){
    Bally = Bally + Yspeed/20;
    }
    if(MouseY-72 < Bally){
    Bally = Bally - Yspeed/20;
    }
    if(MouseY-72 == Bally){
    Yspeed = 0;
    }
    
   
  }
  
  //void checkUmeda(){
  // //Accelerate objectX
  //  if(location.x > width-24 || location.x < 24){
  //    velocity.x = velocity.x*-1;
  //    acceleration.x = acceleration.x*-1;
  //  }
    
  //  if(location.y>height-24 || location.y<24){
  //    velocity.y=velocity.y*-1;
  //    acceleration.y = acceleration.y*-1;
  //  }
  //}
  
  boolean overlaps(Ball other){
    float BallD = dist(Ballx, Bally, other.Ballx, other.Bally);
    if(BallD <=  diameter + other.diameter){
      return true;
    }else{
      return false;
    }
  }
  
}
