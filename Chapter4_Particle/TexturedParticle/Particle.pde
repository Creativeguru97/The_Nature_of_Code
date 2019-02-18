class Particle{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float lifespanOffset = 4.5;
  float R = 200;
  float G = 200;
  float B = 255;
  float BlurValue = 0;
  PImage texture;
  
  Particle(PVector l, PImage texture_){
    location = l.get();
    velocity = new PVector(random(-1.2, 1.2), random(0, 1.5));
    acceleration = new PVector(0, -0.15);
    lifespan = 255;
    texture = texture_;
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
    //stroke(R-30, G-30, lifespan-30, lifespan);
    //fill(R-30, G-30, lifespan-30, lifespan);
    //ellipse(location.x, location.y, random(3), random(3));
    //B -= lifespanOffset;
    //R += lifespanOffset/3;
    //blendMode(ADD);
    imageMode(CENTER);
    //color c = color(R-30, G-30, lifespan-30, lifespan);
    //float value = alpha(c);
    //fill(value);
    tint(R, G, B, lifespan);
    G -= lifespanOffset/20;
    R -= lifespanOffset/3;
    image(texture, location.x, location.y, 60, 60);
    
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
