ArrayList<Stain> stain = new ArrayList<Stain>();;
Sponge s;
void setup(){
   size(700,700);
   s = new Sponge(width/2, height/2, 30);
}

void draw(){
   background(#03ECFF);
   s.run();
   for(int i = stain.size()-1; i>=0; i--){
       Stain st = stain.get(i);
       st.run();
       if(s.adsorb(st)){
           stain.remove(i);
       }
   }
}

void keyPressed(){
   if(key == 'S' || key == 's'){
      float x = random(50,650);
      float y = -30;
      float D = random(10,50);
      color c = color(random(255),random(255),random(255));
      stain.add(new Stain(x,y,D,c));
   }
}

void keyReleased(){
   if(key == 'r' || key == 'R'){
      s = new Sponge(width/2, height/2, 30);
   }
}
