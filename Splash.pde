class Splash{
  PVector pos;
  float r = 3;
  PVector vel;
  float accel = 0.3;
  float friction = 0.995;
  
  Splash(){
    pos = new PVector();
    vel = new PVector();
    vel.x = random(-.5,.5);
    vel.y = random(.3,1);
    pos.x = random(140,260);
    pos.y = 460;
  }

  void display(){
    fill(255);
    
    ellipse(pos.x, pos.y, r, r);
  }
  void bounce(){
    vel.y += accel; //adding acceleration to velocity
    vel.x *= friction; // loss of energy
    vel.y *= friction;
    pos.y += vel.y; // add velocity to position
    pos.x += vel.x;
    //println(vel);
    if (pos.y > (height - r)) {
      vel.y = -vel.y; 
    //if (vel.x <.2){
      //pos.y = height + r;}
  }
  

  }
}
