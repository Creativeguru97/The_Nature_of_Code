// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Mover[] m = new Mover[6];
Attractor a;

void setup() {
  size(640,360);
  
  for(int i = 0; i < m.length; i++){
    m[i] = new Mover(random(width), random(height), random(1, 15)); 
  }
  a = new Attractor();
}

void draw() {
  background(255);
  
  a.drag();
  a.hover(mouseX,mouseY);
  a.display();
  
  for(int i = 0; i < m.length; i++){
    PVector force = a.attract(m[i]);
    m[i].applyForce(force);
    m[i].update();
    m[i].display();
    m[i].checkEdges();
  }
}

void mousePressed() {
  a.clicked(mouseX,mouseY); 
}

void mouseReleased() {
  a.stopDragging(); 
}
