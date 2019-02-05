

class Walker{
  int x, y;
  
  Walker(){
    x = width/2;
    y = height/2;
  }
  
  void render(){
    stroke(0);
    point(x, y);
  }
  
  void step(){
    //Fix random into integer and set as probability
    //int choice = int(random(4));
    
    //if(choice == 0){
    //  x++;
    //}else if(choice == 1){
    //  x--;
    //}else if(choice == 2){
    //  y++;
    //}else{
    //  y--;
    //}
    
    float r = random(1);
    
    if(r < 0.4 ){
      x++;
    }else if(r < 0.6){
      x--;
    }else if(r < 0.8){
      y++;
    }else{
      y--;
    }
    
    /*constrain : force or restrict something
    constrain(); : Constrains a value to not exceed a maximum and minimum value.
    constrain(amt, low, high)*/
    x = constrain(x, 0, width-1);
    y = constrain(y, 0, height-1);
    
  }

}
