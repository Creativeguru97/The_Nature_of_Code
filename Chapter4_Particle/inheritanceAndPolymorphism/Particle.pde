class Particle{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float lifespanOffset = 2.0;
  float R = 170;
  float G = 220;
  float B = 255;
  
  Particle(PVector l){
    location = l.get();
    velocity = new PVector(random(-1,1), random(-2, 0));
    acceleration = new PVector(0, 0.05);
    lifespan = 255;
  }
  
  void excute(){
    fall();
    display();
  }
  
  void fall(){
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= lifespanOffset;
  }

  //float ColorROffset = map(R, 0, lifespan, 0, 255-R);
  void display(){
    stroke(R-30, G-30, lifespan-30, lifespan);
    
    fill(R, G, B, lifespan);
    ellipse(location.x, location.y, 10, 10);
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
