class Repeller{
  float strength = 50;
  PVector location;
  float r = 30;
  
  Repeller(float x, float y) {
    location = new PVector(x, y);
  }
  
  void display(){
    stroke(255);
    fill(255);
    ellipse(location.x, location.y, r*2, r*2);
  }
  
  PVector repel(Particle p){
    PVector dir = PVector.sub(location, p.location);
    float d = dir.mag();
    d = constrain(d, 5, 80);
    dir.normalize();
    float RepelForce = -1 * strength / (d * d);
    dir.mult(RepelForce);
    return dir;

  }
}
