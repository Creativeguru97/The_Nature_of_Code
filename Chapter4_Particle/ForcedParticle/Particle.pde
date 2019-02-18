class Particle{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float lifespanOffset = 2.0;
  float R = 170;
  float G = 220;
  float B = 255;
  
  Particle(){
    location = new PVector(width/2, 50);
    velocity = new PVector(random(-0.5,0.5), random(-1, 0));
    acceleration = new PVector(0, 0);
    lifespan = 255;
  }
  
  void applyGravity(PVector gravity){
    acceleration.add(gravity);
  }
  
  void excute(){
    fall();
    display();
  }
  
  void fall(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= lifespanOffset;
  }

  //float ColorROffset = map(R, 0, lifespan, 0, 255-R);
  void display(){
    stroke(R-30, G-30, lifespan-30, lifespan);
    
    fill(R, G, B, lifespan);
    ellipse(location.x, location.y, random(5), random(5));
    B -= lifespanOffset;
    R += lifespanOffset/3;
  }
  
  boolean isDead(){
    if(lifespan <= 0.0){
      return true;
    }else{
      return false;
    }
  }
}
