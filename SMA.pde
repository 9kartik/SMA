// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Mover m;
float r1,r2;
PShape c1,c2;
//PVector[] f=new PVector[4];
PVector f;
//int [] lst={1,2,3,4,5,6,7,8,9,10,12};
color cl1=color(255,0,0),cl2=color(255,255,0),cl3=color(0,0,0);
boolean hack=false;
void keyPressed(){
  if(key=='h')
    hack=true;
}
void setup() {
  size(375, 667);
  rectMode(CENTER);
  //randomSeed(1);
  m= new Mover(2, width/2, 35);
  
  c1 = createShape(ELLIPSE,width-height/15,height/2,height/15,height/15);
  c1.setFill(cl3);
  c1.setStroke(cl1);
  c2 = createShape(ELLIPSE,height/15,height/2,height/15,height/15);
  c2.setFill(cl3);
  c2.setStroke(cl2);
  f=PVector.random2D();
  //f[0]=PVector.fromAngle(-PI/2);
  //f[1]=PVector.fromAngle(PI);
  //f[2]=PVector.fromAngle(PI/2);
  //f[3]=PVector.fromAngle(0);
}
int cnt=0,period=20;
int rn1=0,rn2=0;
PVector app;
boolean pressed;

void keyReleased(){
   if(key=='h')
     hack=false;
  //println(pressed);
}
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
    //println(keyPressed);
    if(keyPressed)
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
    if(cnt==0){
      /*rn1=lst[int(random(11))];
      for(int i=0;i<4;i++)
      {
          if(((rn1>>i)&1)==1)
          {
            app=f[i].copy();
            app.mult(1+rn1/4);
            m.applyForce(app);
          }
      }*/
      c1.setFill(cl3);
      c2.setFill(cl3);
    }
    else{
      app.mult(0);
      if(rn1%3==0)c1.setFill(cl1);
      if(rn1%3==1)c2.setFill(cl2);
    }
    m.update();
    m.display(hack);
    m.checkEdges();
    cnt=(cnt+1)%period;   
}