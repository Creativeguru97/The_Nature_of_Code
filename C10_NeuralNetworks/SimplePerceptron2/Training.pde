float f(float x) {
  //y = mx + b;
  return -2 * x + 0.2;
}

class Point{
  float x;
  float y;
  float bias = 1;
  int label;
  
  Point(float x_, float y_){
    x = x_;
    y = y_;
  }
  
  Point(){
    x = random(-1, 1);
    y = random(-1, 1);
    
    float lineY = f(x);//Calculate actual the function's value, for this particular x
    if(y > lineY){
      label = 1;
    }else{
      label = -1;
    }
  }

  
  //To convert Pixel coodinate to Cartesian coodinate
  float pixelX(){
    return map(x, -1, 1, 0, width);
  }
  float pixelY(){
    return map(y, -1, 1, height, 0);
  }
  
  void show(){
    stroke(0);
    if(label == 1){
      fill(255);
    }else{
      fill(0);
    }
    //Pixel X
    float px = pixelX();
    float py = pixelY();
    ellipse(px, py, 8, 8);
  }
}
