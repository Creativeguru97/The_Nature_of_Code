class ParticleSystem{
  ArrayList<Particle> particles;
  
  ParticleSystem(){
    particles = new ArrayList<Particle>();
  }
  
  void addParticle(){
    particles.add(new Particle());
  }
  
  void applyGravity(PVector gravity){
    for(Particle p : particles){
      p.applyGravity(gravity);
    }
  }
  
  void applyRepeller(Repeller r){
    for (Particle p : particles){
      PVector force = r.repel(p);
      p.applyGravity(force);
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
