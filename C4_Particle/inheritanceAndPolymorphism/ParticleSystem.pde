class ParticleSystem{
  ArrayList<Particle> particles;
  PVector origin;
  
  ParticleSystem(PVector location){
    origin = location;
    particles = new ArrayList<Particle>();
  }
  
  void addParticle(){
    float r = random(1);
    if(r < 0.15){
      particles.add(new SquareParticle(origin));
    }else{
      particles.add(new Particle(origin));
    }
  }
  
  void run(){
    for(int i = particles.size()-1; i >= 0; i--){
      Particle p = particles.get(i);
      p.fall();
      p.display();
      
      if(p.isDead()){
        particles.remove(i);
      }
    }
  }

}
