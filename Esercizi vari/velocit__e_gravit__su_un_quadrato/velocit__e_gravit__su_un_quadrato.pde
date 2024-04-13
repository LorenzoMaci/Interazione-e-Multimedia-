float x = 240;
float y = 0;
float speed = 0;
float gravity = 0.1;

void setup(){
   size(500, 500);
   frameRate(120);
}

void draw(){
   background(255);
   fill(175);
   stroke(0);
   rectMode(CENTER);
   rect(x,y,30,30);
   
   y += speed; // la y si aggiorna in base alla velocità 
   speed += gravity; // la velocità è uguale alla velocità più la velocità gravitazionale quindi aggiorna ad ogni fotogramma la velocità
   
   if(y > height){
      speed  = speed * -0.95;
      y = height;
   }
}
