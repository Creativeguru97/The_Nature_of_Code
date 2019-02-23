ParticleSystem ps;
Repeller repeller;

ArrayList<ParticleSystem> systems;

void setup(){
  size(960,540);
  ps = new ParticleSystem();
  systems = new ArrayList<ParticleSystem>();
  //repeller = new Repeller(mouseX, mouseY);
}

void draw(){
  repeller = new Repeller(mouseX, mouseY);
  
  PVector gravity = new PVector(0,0.05);
  ps.applyGravity(gravity);
  if(mousePressed){
    PVector wind = new PVector(0.02,0);
    ps.applyGravity(wind);
  }
  
  background(0);
  frameRate(60);
  ps.addParticle();
  repeller.display();
  ps.run();
  
  ps.applyRepeller(repeller);
  
  
}
