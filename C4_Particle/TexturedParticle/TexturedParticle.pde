PImage texture;

ArrayList<Particle> particles;
/*We learn
    add()
    get()
    remove()
    size()
*/

void setup(){
  size(1920,1080,P2D);
  particles = new ArrayList<Particle>();
  texture = loadImage("texture01.png");
  
  //We actually put particles in the Array at here.
  //for(int i = 0; i < 10; i++){
  //  particles.add(new Particle(new PVector(width/2, height/2)));
  //}
}

void draw(){
  background(0);
  frameRate(60);
  blendMode(ADD);
  
  if(mousePressed){
  //If we write this below here, system create particles infinitely without remove()
    for(int i = 0; i < 5; i++){
      particles.add(new Particle(new PVector(float(mouseX), float(mouseY)), texture));
    }
  }
  
    /*If we counting up, there is possibility to crash.
    if there is particle index 0 to 5, and element in index 2 has just dead, 
    elements in after the index 2 is going to sift. Eventually, new element which
    came to index2 will not be checked, so they won't dead.*/
    for(int i = particles.size()-1; i >= 0; i--){
      Particle p = particles.get(i);
      p.fall();
      p.display();
      
      if(p.isDead()){
        particles.remove(i);
      }
    }
    
  
    
    
  
  
  //Sadly, with enhanced loop, we can't modify or manipulate these elements
  //for(Particle p : particles){
  //  p.excute();
  //}
 
  }
