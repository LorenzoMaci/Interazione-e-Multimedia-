ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Warp> warps = new ArrayList<Warp>();
int k = 3; // Numero di Warps

void setup() {
  size(600, 600);
  background(255);
  bullets = new ArrayList<Bullet>();
  warps = new ArrayList<Warp>();
  for (int i = 0; i < k; i++) {
    float x = random(50, 550);
    float y = random(50, 550);
    float angle = random(360);
    float power = random(1, 10);
    color warpColor = color(random(255), random(255), random(255));
    Warp newWarp = new Warp(x, y, warpColor, angle, power);
    warps.add(newWarp);
  }
}

void draw() {
  background(255);
  for (Bullet b : bullets) {
    b.move();
    b.display();
  }
  for (Warp w : warps) {
    w.display();
  }
}

void mousePressed() {
  for (Warp w : warps) {
    if (w.mouseCheck()) {
      w.shot();
    }
  }
}
