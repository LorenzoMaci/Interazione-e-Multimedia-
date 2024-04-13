ArrayList<Asteroid> a;
BlackHole b;

void setup(){
   size(512,512);
   a = new ArrayList<Asteroid>();
   b = new BlackHole(mouseX, mouseY);
}

void draw(){
   background(140, 140, 140);
   
   b.run(a);
   
   
   if(random(1) < 0.15){
      a.add(new Asteroid(random(0,512), random(0,512), random(5,25))); 
   }
   
   for(Asteroid as : a){
      as.run(b);
   }
   
}

void keyPressed(){
   if(key == 'r' || key == 'R'){
      setup(); 
   }
}
