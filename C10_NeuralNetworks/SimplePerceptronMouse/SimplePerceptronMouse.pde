Perceptron p;

Point[] points = new Point[100];

void setup(){
  size(400, 400);
  p = new Perceptron();
  
  for(int i = 0; i < points.length; i++){
    points[i] = new Point();
  }
  
  float[] inputs = {-1, 0.5};
  int guess = p.guess(inputs);
  println(guess);
}

void draw(){
  background(255);
  stroke(0);
  line(0, 0, width, height);
  for(Point pt: points){
    pt.show();
  }
  
  for(Point pt: points){
    float[] inputs = {pt.x, pt.y};
    int target = pt.label;
    //p.train(inputs, target);//Can learn in one moment !!!
    
    int guess = p.guess(inputs);
    if(guess == target){
      fill(0, 255, 0);
      noStroke();
    }else{
      fill(255, 0, 0);
    }
    ellipse(pt.x, pt.y, 4, 4);
  }
}

//To visualize training process well
void mousePressed(){
  for(Point pt: points){
    float[] inputs = {pt.x, pt.y};
    int target = pt.label;
    p.train(inputs, target);
  }
}
