// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Koch Curve
// Renders a simple fractal, the Koch snowflake
// Each recursive level drawn in sequence

ArrayList<KochLine> lines  ;   // A list to keep track of all the lines

void setup() {
  size(640, 360);
  background(255);
  lines = new ArrayList<KochLine>();
  PVector start = new PVector(0, 250);
  PVector end   = new PVector(width, 250);
  lines.add(new KochLine(start, end));
  
  //for (int i = 0; i < 5; i++) {
  //  generate();
  //}

  smooth();
}

void draw() {
  background(255);
  for (KochLine l : lines) {
    l.display();
  }
  
  if(mousePressed){
    for(KochLine l : lines) {
      l.wiggle();
    }
  }
}

void keyPressed(){
  if(key == ' '){
    generate();
  }
}

void generate() {
  ArrayList next = new ArrayList<KochLine>();    // Create emtpy list
  for (KochLine l : lines) {
    // Calculate 5 koch PVectors (done for us by the line object)
    PVector a = l.kochA();                 
    PVector b = l.kochB();
    PVector c = l.kochC();
    PVector d = l.kochD();
    PVector e = l.kochE();
    // Make line segments between all the PVectors and add them
    next.add(new KochLine(a, b));
    next.add(new KochLine(b, c));
    next.add(new KochLine(c, d));
    next.add(new KochLine(d, e));
  }
  lines = next; //Next generation is now current one.
}
