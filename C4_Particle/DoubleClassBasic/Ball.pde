class Ball{
  PVector location;
  
  Ball(PVector l){
    location = l.get();
  }
  
  void display(){
    stroke(0);
    fill(100);
    ellipse(location.x, location.y, 50, 50);
  }
}
