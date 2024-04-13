Casa c;
ArrayList<Casa> casa;

void setup(){
  size(500,500);
  
  casa = new ArrayList<Casa>();
}

void draw(){
   background(0); 
   
   for(Casa c : casa){
      c.run(); 
   }
   
}

void mousePressed(){
   if(mouseButton == LEFT){
       casa.add(new Casa());
   }
   if(mouseButton == RIGHT){
      casa.add(new Casetta());
   }
}

void keyPressed(){
   if(key == 'r'){
      setup(); 
   }
}
