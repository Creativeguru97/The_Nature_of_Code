class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  
  float angular = 0.0;
  float aVelocity = 0.0;
  float aAcceleration = 0.001;

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
    aAcceleration = acceleration.x/10.0;
    aVelocity += aAcceleration;
    angular += aVelocity;
    
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    
    //aAcceleration = acceleration.x/10.0;
    //aVelocity += aAcceleration;
    //angular += aVelocity;
  
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    
    /*save current coordinate by pushMatirx, 
    and restore (this time means "abandon") the prior coordinate by popMatrix*/
    pushMatrix();
    translate(position.x, position.y);
    rotate(angular);
    rectMode(CENTER);
    rect(0,0,mass*5,mass*5);
    popMatrix();
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
