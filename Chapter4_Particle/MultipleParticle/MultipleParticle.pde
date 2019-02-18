ParticleSystem ps;
ArrayList<ParticleSystem> systems;

void setup(){
  size(640,360);
  ps = new ParticleSystem(new PVector(mouseX, mouseY));
  systems = new ArrayList<ParticleSystem>();
  
}

void draw(){
  background(0);
  frameRate(60);
  
  for(ParticleSystem ps : systems){
    ps.addParticle();
    ps.run();
  }
}

void mousePressed(){
  systems.add(new ParticleSystem(new PVector(mouseX, mouseY)));
  
}
