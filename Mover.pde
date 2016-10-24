// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float radius;

  Mover(float m, float x , float y) {
    mass = m;
    radius=mass*8;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(5);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display(boolean hack) {
    //stroke(0);
    //noStroke();
    strokeWeight(2);
    stroke(255);
    fill(255);
    ellipse(location.x,location.y,mass*16,mass*16);
    //println(acceleration.x,acceleration.y);
    if(hack)
      {
        line(location.x,location.y,location.x+velocity.x*10,location.y+velocity.y*10);
        line(2*height/15-radius,0,2*height/15-radius,height);
        line(width-2*height/15+radius,0,width-2*height/15+radius,height);
    }
  }

  void checkEdges() {

    if (location.x > width-2*height/15) {
      location.x = width-2*height/15;
      //velocity.x *= -1;
    } else if (location.x < 2*height/15) {
      location.x = 2*height/15;
      //velocity.x *= -1;
    }

    if (location.y > height) {
      //velocity.y *= -1;
      location.y = height;
    }else if (location.y < 0) {
      location.y = 0;
      //velocity.y *= -1;
    }

  }

}