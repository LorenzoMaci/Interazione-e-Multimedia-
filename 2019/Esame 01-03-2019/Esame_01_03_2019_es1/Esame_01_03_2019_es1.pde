AmazingBlock a;
Block b;

void setup(){
   size(256,512);
   
   b = new Block(random(width), random(height/2), 40, 60);
   a = new AmazingBlock(random(width), random(height/2+40, height-40), 40, 60);
}

void draw(){
   background(0); 
   
   a.run();
   b.run();
   
}

void keyPressed(){
   if(key == 'r' || key == 'R'){
      setup(); 
   }
}
