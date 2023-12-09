class Rock {
  PVector pos;
  
  Rock() {
    pos = new PVector(0,0);
    pos.x = random(150,250);
    pos.y = random(340,360);
  }
  
  void display() {
    float ranR = random(140,160);
    float ranG = random (50,80);
    float ranB = random(10,30);
    fill(ranR, ranG, ranB); // Brown color
    noStroke();
    ellipse(pos.x, pos.y, 25, 10);
  }
}
