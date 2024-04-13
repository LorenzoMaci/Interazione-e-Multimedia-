ArrayList<Smoke> sm;
ArrayList<Torpedo> to;

void setup(){
   size(512,512);
   frameRate(60);
  
   sm = new ArrayList<Smoke>();
   to = new ArrayList<Torpedo>();
}

void draw(){
   background(#00E6FA);
   
   
   for(Smoke s : sm){
      s.run(); 
   }
   
   for(Torpedo t : to){
      t.run();
      
      if(random(1) < 0.5){
          t.smoke();
      }
   }
}

void keyPressed(){
   if(key == 'N' || key == 'n'){
      to.add(new Torpedo(-50, random(50, 450), random(5,10))); 
   }
}
