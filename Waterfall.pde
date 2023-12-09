class Waterfall {
  PVector pos;
  float acc;
  
  Waterfall(float ranX, float ranX2, float ranY, float ranY2) {
    pos = new PVector();
    pos.x = random(ranX,ranX2);
    pos.y = random(ranY, ranY2);
    acc = random(2, 6); 
  }
  
  void stream() {
    pos.y += acc;
  }
  
  void river(){
    pos.x += acc;
  }
  
  void display(float x, float y) {
    float colorBlue = random(0,255);
    fill(0, 0, colorBlue); // Blue color
    noStroke();
    ellipse(pos.x, pos.y, x, y);
  }
  
  boolean hitsGround() {
    return pos.y > height;
  }
  
  boolean hitsEnd() {
    return pos.x > width;
  }
}
