ArrayList<Cifra> cifra;
ArrayList<Cifrotta> c;
void setup(){
   size(500,500);
   
   cifra = new ArrayList<Cifra>();
   c = new ArrayList<Cifrotta>();
}

void draw(){
   background(0); 
   
   for(Cifra c1 : cifra){
       c1.run();
     }
     
     for(Cifrotta c2 : c){
        c2.run(); 
     }
    
}

void keyPressed(){
  if(key >= '0' && key <= '4'){
     cifra.add(new Cifra(int(random(width)), int(random(height)), char(int(random(33, 126)))));
  }
  if(key >= '5'  && key <= '9'){
     c.add(new Cifrotta(int(random(width)), int(random(height)), char(int(random(33, 126)))));
  }
}

void mousePressed(){
   if(mouseButton == RIGHT){
      setup(); 
   }
}
