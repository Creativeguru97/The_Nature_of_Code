Particle ps;

void setup(){
  size(640,360);
  ps = new Particle(new PVector(width/2,10));
}

void draw(){
  background(255);
  ps.excute();
  if(ps.isDead()){
    println("particle dead!");
  }
}
