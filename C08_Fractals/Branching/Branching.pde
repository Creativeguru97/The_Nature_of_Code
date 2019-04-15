void setup(){
size(640, 360);
smooth();
//Trunk of tree
//translate(width/2, height);
//line(0, 0, 0, -150);
//translate(0, -150);
}

void draw(){
  translate(width/2, height);
  background(255);
  stroke(0);
  branch(60);
}

void branch(float len){
//Branch right
//Push matrix saves current transformation state, then pop matrix restores it.
  line(0,0,0,-len);
  translate(0, -len);
  
  len *= 0.66;
  if(len>2){
    pushMatrix();
    rotate(PI/4);//Turn right 45 degrees
    //line(0,0,0,-100);
    branch(len);
    popMatrix();
    
    //Branch left
    pushMatrix();
    rotate(-PI/4);
    //line(0,0,0,-100);
    branch(len);
    popMatrix();
    len +=1;
  }
}
