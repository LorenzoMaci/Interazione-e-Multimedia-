

ArrayList<Ball> abs;

void setup() {
  background(0);
  size(1000, 500);
  abs = new ArrayList<Ball>();
}

void draw() {
  noStroke();
  fill(0, 40);
  rect(0, 0, width, height);
  
  for (Ball b:abs) {
    b.run();
  }
}

void keyPressed() {
  if ((key == 'N') || (key == 'n')) {
    abs.add(new Ball(random(50, 450), random(50, 450), random(25, 70), random(1, 10), random(1,10)));
  }
  
  if ((key == 'G') || (key == 'g')) {
    abs.add(new GreenBall(random(50, 450), random(50, 450), random(25, 70), random(1, 10), random(1,10)));
  }
  
}
