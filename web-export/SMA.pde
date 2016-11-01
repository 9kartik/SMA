// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Mover m;
float r1,r2;
PShape //c1,//c2;
PVector[] f=new PVector[4];
int [] lst={1,2,3,4,5,6,7,8,9,10,12};
color cl1=color(255,0,0),cl2=color(255,255,0),cl3=color(0,0,0);
void setup() {
  size(375, 667);
  rectMode(CENTER);
  //randomSeed(1);
  m= new Mover(2, width/2, 35);
  
  //c1 = beginShape(ELLIPSE,width-height/15,height/2,height/15,height/15);
  //c1.setFill(cl3);
  //c1.setStroke(cl1);
  //c2 = beginShape(ELLIPSE,height/15,height/2,height/15,height/15);
  //c2.setFill(cl3);
  //c2.setStroke(cl2);
  
  f[0]=PVector.fromAngle(PI);
  f[1]=PVector.fromAngle(-PI/2);
  f[2]=PVector.fromAngle(0);
  f[3]=PVector.fromAngle(PI/2);
}
int cnt=0,period=20;
int rn1=0,rn2=0;
PVector app;
//boolean pressed;
int token=0,token2=0;
PVector base=new PVector(0,0);
void keyReleased(){
  //pressed=false;
    //println("asdas");
    if(token<4 && token>=0)
      token=keyCode-LEFT;
    token2&=(~(1<<token));
  }
  
   void keyPressed()
    {
       token=keyCode-LEFT;
       //println(token);
       if(token<4 && token>=0)
       {
          token2|=(1<<token);
       }
    }
    float c = -0.05;
void draw() {
  background(0);
  pushStyle();
  noFill();
  ellipseMode(CENTER);
  stroke(color(255,255,255));
  rect(width/2,height/2,height/4,height/4);
  stroke(color(255,122,255));
  rect(width/2,height/2,height/6,height/6);
  shape(//c1);
  shape(//c2);
  popStyle();
    //println(keyPressed);
   
      
    if(token2>0)
    {
      for(int i=0;i<4;i++)
        {
        println(token2);
        if((token2>>i&1)==1)
        base.add(f[i]);
        }
    }
    else base.mult(0);
    m.applyForce(base);
            
    if(cnt==0){
      rn1=lst[int(random(11))];
      for(int i=0;i<4;i++)
      {
          if(((rn1>>i)&1)==1)
          {
            app=f[i].copy();
            app.mult(1+rn1/4);
            //m.applyForce(app);
          }
      }
      //c1.setFill(cl3);
      //c2.setFill(cl3);
    }
    else{
      app.mult(0);
      if(rn1%3==0)//c1.setFill(cl1);
      if(rn1%3==1)//c2.setFill(cl2);
    }
    m.update();
    m.display();
    m.checkEdges();
    PVector friction = m.velocity.copy(); 
    friction.setMag(c);    
    m.applyForce(friction);
    cnt=(cnt+1)%period;   
}
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

