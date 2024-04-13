ArrayList<Egg> eggs;
Bucket b;

void setup(){
   size(500,500);
   frameRate(60);
   
   eggs = new ArrayList<Egg>();
   b = new Bucket();
}


void draw(){
  background(#00CAFF); 
  
  b.run();
  if (random(0, 100) < 5) {
    float x = random(25, width - 25);
    float sy = random(4, 8);
    eggs.add(new Egg(x, 0, sy));
  }
  
  
  for(Egg e : eggs){
     e.run();
     b.checkDist(e);
  }
}

void keyPressed(){
   if(key == 'r'){
      setup(); 
   }
}
