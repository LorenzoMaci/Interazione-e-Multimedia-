int a = 0;

void setup(){
   size(500,500); 
   frameRate(120);
   rectMode(CENTER);
}

void draw(){
    background(0);
    translate(width/2, height/2);
    rotate(radians(a));
    rect(0, 0, 50, 50);
    a++;
}
