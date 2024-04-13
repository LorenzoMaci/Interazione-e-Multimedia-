void setup(){
   size(700,500);
   
}

void draw(){
  background(0);
  float r = map(mouseX, 0, width, 20, 250);
  fill(255, r, 0);
  ellipse(width/2, height/2, r, r);
  
}
