class Particle{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  Particle(PVector l){
    location = l.get();
    velocity = new PVector(random(2,1), random(-2, 0));
    acceleration = new PVector(0, 0.1);
    lifespan = 255;
  }
  
  void excute(){
    fall();
    display();
  }
  
  void fall(){
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
  }
  
  void display(){
    stroke(0, lifespan);
    fill(100, lifespan);
    ellipse(location.x, location.y, 10, 10);
  }
  
  boolean isDead(){
    if(lifespan <=0.0){
      return true;
    }else{
      return false;
    }
  }
}
