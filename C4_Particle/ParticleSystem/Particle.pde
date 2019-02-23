class Particle{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float lifespanOffset = 2.0;
  float R = 170;
  float G = 220;
  float B = 255;
  float BlurValue = 0;
  
  Particle(PVector l){
    location = l.get();
    velocity = new PVector(random(-1, 1), random(-2, 0));
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
    fill(R-30, G-30, lifespan-30, lifespan);
    
    ellipse(location.x, location.y, random(3), random(3));
    B -= lifespanOffset;
    R += lifespanOffset/3;
    
    //TOO HEAVY THIS EFFECT!!!
    //float BlurValue = map(lifespanOffset, 0, 255, 0, 3);
    //filter(BLUR, BlurValue);
  }
  
  boolean isDead(){
    if(lifespan <= 0.0){
      return true;
    }else{
      return false;
    }
  }
}
