Ball b;
HyperBall h;

void setup(){
   size(512,256);  
    
    b = new Ball(random(width/2), random(height), 40);
    h = new HyperBall(random(width/2, width), random(height), 40);
}

void draw(){
   background(0); 
   
   b.run();
   
   h.run();
   
}

void keyPressed(){
   if(key == 'r' || key == 'R'){
      setup(); 
   }
}
