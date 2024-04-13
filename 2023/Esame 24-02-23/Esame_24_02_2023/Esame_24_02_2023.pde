ArrayList<Voto> voto;
ArrayList<Votone> votone;

void setup(){
   size(500,500);
   
   voto = new ArrayList<Voto>();
   votone = new ArrayList<Votone>();
}

void draw(){
   background(0);
   
   for(Voto v : voto){
      v.run(); 
   }
   
   for(Votone vt : votone){
       vt.run();
   }
   
   
}

void keyPressed(){
   if(key == 'R' || key == 'r'){
      setup(); 
   }
}

void mousePressed(){
   if(mouseButton == LEFT){
      voto.add(new Voto()); 
   }
   if(mouseButton == RIGHT){
      votone.add(new Votone()); 
   }
}
