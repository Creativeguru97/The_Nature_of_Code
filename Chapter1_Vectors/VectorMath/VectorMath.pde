/*  if Vector"a" = (ax, ay) and Vector"b" = (bx, by)
Vector"a*b" = ax*bx + ay*by  */

/*mag(); is magnitude. It's length of the vector.
mag() does give us square root of vector"a"*vector"a"+vector"b"*vector"b"
and which means the mag() value is always positive. */

void setup(){
  size(640,480);
}

void draw(){
  background(255);
  strokeWeight(2);
  stroke(0);
  noFill();
  
  //translate(0, 0);
  ellipse(0, 0, 4, 4);
  
  PVector mouse = new PVector(mouseX, mouseY);
  PVector center = new PVector(0, 0);
  
  mouse.sub(center);
  //mouse.normalize();//forcibly adjest the magnitude scale "1"
  //mouse.mult(50);//Then, multiply the scale
  //mouse.mult(5);
  //m's value is length of vector"mouse"
  
  //mouse.setMag(200);//We can simplify normalize(); and mult(); as setMag();
  
  
  float m = mouse.mag();
  fill(255, 0, 0);
  rect(0, 0, m, 20);
  line(0, 0, mouse.x, mouse.y);
  
  PVector a = new PVector(100, 150);
  PVector b = new PVector(50, 120);
  stroke(255,0,0);
  ellipse(a.x, a.y, 4, 4);
  stroke(0,255,0);
  ellipse(b.x, b.y, 4, 4);
  
  
}
