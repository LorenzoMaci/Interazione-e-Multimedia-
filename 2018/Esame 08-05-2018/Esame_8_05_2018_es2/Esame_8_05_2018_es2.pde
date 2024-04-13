ArrayList<Asteroid> as;
ArrayList<Bullet> b;
Gun g;

void setup(){
   size(512,512);
   frameRate(60);
   as = new ArrayList<Asteroid>();
   b = new ArrayList<Bullet>();
   g = new Gun();
}

void draw(){
   background(#00FFFD); 
  
   g.run();
   
   for(Bullet bu : b){
      bu.run(); 
   }
   
   for(Asteroid a : as){
      a.run();
      for(Bullet bu : b){
         a.hit(bu); 
      }
   }
   
   if(random(0, 100) < 5){
      as.add(new Asteroid(-50, random(256), random(2, 7), random(-2, 2))); 
   }
}

void keyPressed(){
   if(key == 'A' || key == 'a'){
     b.add(g.shot());
   }
   if(key == 'r' || key == 'R'){
      setup(); 
   }
}
