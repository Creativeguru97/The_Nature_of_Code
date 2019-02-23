class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float EachPositionX, float EachPositionY, float EachMass) {
    position = new PVector(EachPositionX, EachPositionY);
    velocity = new PVector(1,0);
    acceleration = new PVector(0,0);
    mass = EachMass;
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(position.x,position.y,mass*5,mass*5);
  }

  void checkEdges() {
    
    if (position.x > width-mass*10/2) {
      position.x = width-mass*10/2;
      velocity.x *= -1;
    } else if (position.x < mass*10/2) {
      position.x = mass*10/2;
      velocity.x *= -1;
    }

    if (position.y > height-mass*10/2) {
      position.y = height-mass*10/2;
      velocity.y *= -1;
    }else if (position.y < mass*10/2) {
      position.y = mass*10/2;
      velocity.y *= -1;
    }

  }

}
