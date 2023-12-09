class WindParticle {
  PVector pos;
  PVector velocity;
  float size;
  
  WindParticle(float x, float y, PVector wind) {
    this.pos = new PVector(x, y);
    this.velocity = wind.copy().mult(10);
    this.size = random(10, 20);
  }
  
  void update() {
    pos.add(velocity);
  }
  
  void display() {
    stroke(100, 100, 255);
    line(pos.x, pos.y, pos.x - velocity.x, pos.y - velocity.y);
  }
}
