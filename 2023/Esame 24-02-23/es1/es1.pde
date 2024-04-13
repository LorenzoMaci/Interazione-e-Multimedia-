Voto v;
ArrayList<Voto> abs;
void setup(){
  size(500,500);
  
  abs = new ArrayList<Voto>();
}

void draw(){
   background(0);
   
   for(Voto v : abs){
      v.run(); 
   }
}

void mousePressed(){
   if(mouseButton == LEFT){
      abs.add(new Voto(random(width), random(height - 14), random(2,10)));
   }
   if(mouseButton == RIGHT){
      abs.add(new Votone(random(width - 20),random(height - 20), 0));
   }  
}

void keyPressed(){
   if(key == 'r' || key == 'R'){
      setup(); 
   }
}
