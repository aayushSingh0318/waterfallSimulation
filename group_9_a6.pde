import processing.sound.*;

ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Waterfall> drops = new ArrayList<Waterfall>();
ArrayList<Waterfall> river = new ArrayList<Waterfall>();
ArrayList<Splash> splashes = new ArrayList<Splash>();

int windType = 0;
PVector gravity = new PVector(0, 0.02); 

Tree[] trees = new Tree[3];
ArrayList<WindParticle> windParticles = new ArrayList<WindParticle>();

// must install sound library
SoundFile forestAudio;

Star[] stars = new Star[5];
Firefly[] fireflies = new Firefly[5];

void setup() {
  size(500, 500);
  frameRate(30);
  forestAudio = new SoundFile(this, "forestAudio.mp3"); // Replace with your audio file
  
  // Stars and Fireflies
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star(0.02);
  }
  for (int i = 0; i < fireflies.length; i++) {
    fireflies[i] = new Firefly(0.2, 4, 4);
  }

  // Create Trees
  trees[0] = new Tree(width/4, height-150, 150, 100);
  trees[1] = new Tree(width/2, height-150, 200, 120);
  trees[2] = new Tree(3*width/4, height-150, 150, 100);

  // Create Rocks
  for (int i = 0; i < 20; i++) {
    rocks.add(new Rock());
  }

  // Create Waterfall Particles
  for (int i = 0; i < 500; i++) {
    drops.add(new Waterfall(160, 240, 360, 375));
  }

  // Create River Streams
  for (int i = 0; i < 300; i++) {
    river.add(new Waterfall(150, 200, 490, 500));
  }
}

void draw() {
  background(0);
  
  // Ground
  fill(#893A1A);
  rect(0, 350, 500, 150);
  
  // Stars
  for (int i = 0; i < stars.length; i++) {
    stars[i].flicker();
    stars[i].move();
  }
  
  // Fireflies
  for (int i = 0; i < fireflies.length; i++) {
    fireflies[i].flicker();
    fireflies[i].randomPathMovement();
  }

  // Trees and Wind Particles
  for (Tree t : trees) {
    t.display();
  }

  for (int i = windParticles.size() - 1; i >= 0; i--) {
    WindParticle wp = windParticles.get(i);
    wp.update();
    wp.display();
    
    if (wp.pos.x > width || wp.pos.x < 0) {
      windParticles.remove(i);
    }
  }

  // Rocks
  for (Rock rock : rocks) {
    rock.display();
  }

  // Water Splashes
  for (Splash splash : splashes) {
    splash.display();
    splash.bounce();
  }

  // River from the Waterfall
  for (Waterfall stream : river) {
    stream.display(50, 1);
    stream.river();
  }

  // Waterfall Particles and Move Stream of Water
  for (int i = drops.size() - 1; i >= 0; i--) {
    Waterfall drop = drops.get(i);
    drop.stream();
    drop.display(1, 50);
    if (drop.hitsGround()) {
      drops.remove(i);
      drops.add(new Waterfall(160, 240, 360, 375));
      river.add(new Waterfall(0, 100, 490, 500));
      if (frameCount % 10 == 0) {
        splashes.add(new Splash());
      }
    }
  }
}

void mouseClicked() {
  PVector wind;
  if (windType == 0) {
    wind = new PVector(random(-0.1, 0.1), 0);
  } else {
    wind = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
  }
  windType = (windType + 1) % 2;

  for (Tree t : trees) {
    t.applyForce(wind);
  }

  for (int i = 0; i < 30; i++) {
    windParticles.add(new WindParticle(random(width), random(height), wind));
  }
}

void keyPressed() {  
  if (!forestAudio.isPlaying()) {
    forestAudio.play();
  } else {
    forestAudio.stop();
  }
}
