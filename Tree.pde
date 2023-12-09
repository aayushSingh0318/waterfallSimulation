class Tree {
  float x, y;
  float trunkHeight;
  float leafSize;
  PVector force;

  Tree(float x, float y, float trunkHeight, float leafSize) {
    this.x = x;
    this.y = y;
    this.trunkHeight = trunkHeight;
    this.leafSize = leafSize;
    force = new PVector(0, 0);
  }

  void applyForce(PVector windForce) {
    this.force = windForce;
  }

  void display() {
    // trunk
    stroke(139, 69, 19);
    fill(139, 69, 19);
    rect(x, y - trunkHeight, trunkHeight/10, trunkHeight);
    
    // background shape for leaves
    fill(34, 139, 34);
    ellipse(x, y - trunkHeight + leafSize/2, leafSize, leafSize);
    
    // leaves with physics-based movement
    int leavesCount = int(leafSize/10);
    for (int i = 0; i < leavesCount; i++) {
      Leaf l = new Leaf(x + random(-leafSize/2, leafSize/2), y - trunkHeight + random(0, leafSize), leafSize/leavesCount, force);
      l.display();
    }
  }
}
