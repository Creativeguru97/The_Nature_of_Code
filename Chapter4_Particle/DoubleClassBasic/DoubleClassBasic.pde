BallSystem bs;
ArrayList<BallSystem> systems;

void setup(){
  size(640,360);
  bs = new BallSystem(new PVector(mouseX, mouseY));
  systems = new ArrayList<BallSystem>();
}

void draw(){
  background(255);
  frameRate(60);
  
  for(BallSystem bs : systems){
    bs.addBall();
    bs.run();
  }

}

void mousePressed(){
  systems.add(new BallSystem(new PVector(mouseX, mouseY)));
}
