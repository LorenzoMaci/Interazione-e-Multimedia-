Pillow p;
SuperPillow s;

void setup(){
   size(256,512);
   
   p = new Pillow(int(random(width)), int(random(256)), 40, 80);
   s = new SuperPillow(int(random(width)), int(random(256)), 40, 80);
   
}


void draw(){
   background(0); 
   
   p.run();
   s.run();
}

void keyPressed(){
   if(key == 'r' || key == 'R'){
      setup(); 
   }
}
