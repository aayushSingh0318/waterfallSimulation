class Leaf {
  float x, y;
  float size;
  PVector force;
  color leafColor;

  Leaf(float x, float y, float size, PVector force) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.force = force;
    this.leafColor = color(random(34, 85), random(100, 155), 34);
  }

  void display() {
    fill(leafColor);
    noStroke();
    ellipse(x + force.x*size + gravity.x*size, y + force.y*size + gravity.y*size, size, size*1.5);
  }
}
