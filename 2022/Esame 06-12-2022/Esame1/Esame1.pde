Mongolfiera m;
MongolfieraMotorizzata mm;
void setup(){
   size(512, 512);
   
   m = new Mongolfiera(random(width), height/3);
   mm = new MongolfieraMotorizzata(random(35, width - 35), height*2/3);
}

void draw(){
   background(255); 
   
   m.run();
   
   mm.run();
}

void keyPressed(){
   if(key == 'r' || key == 'R'){
      setup(); 
   }
}
