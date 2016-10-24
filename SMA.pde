// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Mover m;
float r1,r2;
PShape c1,c2;


void setup() {
  size(375, 667);
  rectMode(CENTER);
  //randomSeed(1);
  m= new Mover(2, width/2, 35);
  c1 = createShape(ELLIPSE,width-height/15,height/2,height/15,height/15);
  c1.setFill(color(255,0,0));
  c2 = createShape(ELLIPSE,height/15,height/2,height/15,height/15);
  c2.setFill(color(255,255,0));
  
}
/*void keyPressed(){
  switch(key)
       {
          case UP:println("U",(-PI/2)); m.applyForce(PVector.fromAngle((-PI/2))); break;
          case LEFT:println("L",(PI)); m.applyForce(PVector.fromAngle((PI))); break;
          case DOWN: println("D",(PI/2));m.applyForce(PVector.fromAngle((PI/2))); break;
          case RIGHT:println("R",(0)); m.applyForce(PVector.fromAngle((0))); break;
       }
}*/
void draw() {
  background(0);
  pushStyle();
  noFill();
  ellipseMode(CENTER);
  stroke(color(255,255,255));
  rect(width/2,height/2,height/4,height/4);
  stroke(color(255,122,255));
  rect(width/2,height/2,height/6,height/6);
  shape(c1);
  
  shape(c2);
  popStyle();
    
    if(keyPressed && key==CODED)
    {
       switch(keyCode)
       {
          case UP: m.applyForce(PVector.fromAngle((-PI/2))); break;
          case LEFT:m.applyForce(PVector.fromAngle((PI))); break;
          case DOWN:m.applyForce(PVector.fromAngle((PI/2))); break;
          case RIGHT:m.applyForce(PVector.fromAngle((0))); break;
          default:break;
       }
    }
    else{
      float c = -0.05;
    PVector friction = m.velocity.copy(); 
    friction.normalize();
    friction.mult(c);

    m.applyForce(friction);
    }
    m.update();
    m.display();
    m.checkEdges();
}