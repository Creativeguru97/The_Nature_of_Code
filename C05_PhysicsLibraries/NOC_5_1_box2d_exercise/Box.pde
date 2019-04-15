// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A rectangular box
class Box  {
  
  Body body;

  float x,y;
  float w,h;

  // Constructor
  Box(float x_, float y_) {
    x = x_;
    y = y_;
    w = 16;
    h = 16;
    
    //Step 1: Define Body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    //Convert pixel processing coodinate to box2d world one.
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    
    //Step 2: Create Body
    body = box2d.createBody(bd);
    
    //Step 3: Create Shape
    PolygonShape ps = new PolygonShape();
    //Convert defined pixel width and height to be box2d world units
    float box2Dw = box2d.scalarPixelsToWorld(w/2);
    float box2Dh = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2Dw,box2Dh);
    
    //Step 4: Create Fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    //Parameters that affects physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    
    //Step 5: Attach Shape to Body with Fixture
    body.createFixture(fd);
  }


  // Drawing the box
  void display() {
    //Ask box2d "Where is the body?"
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    pushMatrix();
    translate(pos.x, pos.y);
    //set angular -a because y-axis in box 2d world point up.
    rotate(-a);
    fill(200);
    stroke(0);
    strokeWeight(1);
    rectMode(CENTER);
    rect(0,0,w,h);
    popMatrix();
  }
}
