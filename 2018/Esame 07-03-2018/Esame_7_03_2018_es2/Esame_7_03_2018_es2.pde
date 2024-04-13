ArrayList<Spear> sp;
Baloon b;
double energy;

void setup(){
   size(512,512);
   frameRate(60);
   sp = new ArrayList<Spear>();
   b = new Baloon(width/2, height - height * 5 / 100);
   energy = 0;
}

void draw(){
  background(0,255,255);
    
  fill(255);
  rect(0, height - (height*0.05), width, height - (height*0.05));
  
  b.run(energy);
  
  for(Spear s : sp){
     s.run(); 
     if(b.hit(s)){
        noLoop(); 
     }
  }
  
  if(b.range()){
      energy *= -1;
  }
  
  if(random(1) < 0.1){
     sp.add(new Spear(int(random(width)) , -60, abs(random(3,8))));
  }
  
  if(keyPressed){
    if((key == 'A' || key == 'a') && energy > -3){
      energy -= 0.2; 
   }
   if((key == 'D' || key == 'd') && energy < 3){
      energy += 0.2; 
   }
   if(energy > 0){
      energy -= 0.05; 
   }
   if(energy < 0){
      energy += 0.05; 
   } 
  }
}

void keyPressed(){
   if(key == 'R' || key == 'r'){
       setup();
       loop();
   }
}
