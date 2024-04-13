ArrayList<FireBall> f;
Volcano v1, v2, v3;
boolean state = false;

void setup(){
   size(640,480);
   frameRate(60);
   
   v1 = new Volcano(random(0,  width - 150), height - 55);
   v2 = new Volcano(random(0,  width - 150), height - 55);
   v3 = new Volcano(random(0,  width - 150), height - 55);
   
   f = new ArrayList<FireBall>();
}

void draw(){
   background(0);
   
   v1.run();
   v2.run();
   v3.run();
   
   for(FireBall fire : f){
      fire.run(); 
   }
   
   if(state){
     if(random(1) < 0.2){
       f.add(v1.generate());
       f.add(v2.generate());
       f.add(v3.generate());
     }
   }
}

void keyPressed(){
   if(key == 'N' || key == 'n'){
      if(state){
         state = false;
         print("State false");
      }else{
         state = true; 
      }
   }
}
