//stars
class Star {
  float flickerFreq;

  Star(float freq) {
    flickerFreq = freq;
  }

  void flicker() {
    noStroke();
    if (random(1) < flickerFreq) {
      fill(255, 255, 204, 150);
    } else {
      fill(255, 200);
    }
    float s = 4;
    ellipse(random(width), random(height/3), s, s);
  }

  void move() {
    float xOff = cos(radians(frameCount * 0.002)) * 50;
    float x = xOff + width / 2;
    float y = height / 2;
    fill(255);
    ellipse(x, y, 1, 1);
  }
}
