class Liquid{
  float x,y,w,h;
  
  Liquid(float x_, float y_, float w_, float h_){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
  }
  
  boolean contains(Ball b){
    PVector l = b.location;
    if(l.x > x && l.x < x + w && l.y > y && l.y < y + h){
      return true;
    }else{
      return false;
    }
  }
  
    //Water or gas resistance
    
    PVector Resistance(Ball b){
      PVector ResistanceF= b.velocity.get();
      ResistanceF.normalize();
      ResistanceF.mult(-1);
      float c2 = 0.1;
      float speed = b.velocity.magSq();
      //We gain squared value
      
      ResistanceF.mult(c2 * speed);
      return ResistanceF;
    }
    
    void display(){
      rect(x, y, w, h);
    }
}
