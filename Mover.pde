// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float m, float x , float y) {
    mass = m;
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

  void display() {
    stroke(255);
    //noStroke();
    //strokeWeight(2);
    
    fill(255);
    ellipse(location.x,location.y,mass*16,mass*16);
    //PVector p=new PVector(velocity.x,velocity.y);
    //float ang=p.heading();
    PVector pv=velocity.copy(),pv2=velocity.copy();
    pv.rotate(PI/2).setMag(mass*8);
    pv2.rotate(-PI/2).setMag(mass*8);
    //stroke(0,255,0);
    //line(location.x,location.y,location.x+10*velocity.x,location.y+10*velocity.y);
    //stroke(255,0,0);
    //line(location.x,location.y,location.x+pv.x,location.y+pv.y);
    //stroke(0,0,255);
    pushMatrix();
    translate(location.x+velocity.x*10,location.y+velocity.y*10);
    //line(velocity.x*10,velocity.y*10,pv.x,pv.y);
    //line(velocity.x*10,velocity.y*10,pv2.x,pv2.y);
    triangle(velocity.x*10,velocity.y*10,pv.x,pv.y,pv2.x,pv2.y);
    popMatrix();
    //println(location.angle());
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