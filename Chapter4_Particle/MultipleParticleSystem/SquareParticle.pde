class SquareParticle extends Particle{
  
  SquareParticle(PVector l){
    super(l);
  }
  
  
  void display(){
    //fill(100);
    fill(R, G, B, lifespan);
    stroke(R-30, G-30, lifespan-30, lifespan);
    rectMode(CENTER);
    rect(location.x, location.y, 10, 10);
    B -= lifespanOffset;
    R += lifespanOffset/3;
  }
}
