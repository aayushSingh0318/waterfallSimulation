//firefly
class Firefly extends Star {
  float x;
  float y;
  PVector velocity;
  float brightness;

  Firefly(float freq, float vx, float vy) {
    super(freq);
    x = random(width);
    y = random(height);
    velocity = new PVector(vx, vy);
    brightness = random(100, 255);
  }

  void randomPathMovement() {
    float stepX = random(-velocity.x, velocity.x) * 2;
    float stepY = random(-velocity.y, velocity.y) * 2;
    x = constrain(x + stepX, 0, width);
    y = constrain(y + stepY, 0, height);
  }
  
  void flicker() {
    float dimAmount = 50;
    if (random(1) < flickerFreq) {
      brightness = constrain(brightness + dimAmount, 100, 255);
    } else {
      brightness = constrain(brightness - dimAmount, 0, 255);
    }
    noStroke();
    fill(255, 255, 0, brightness); // Set fill color to bright yellow
    ellipse(x, y, 20, 20);
  }
}
