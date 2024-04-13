ArrayList<Saetta> sa;
ArrayList<SaettaLampegginante> sl;

void setup(){
   size(500,500);
   sa = new ArrayList<Saetta>();
   sl = new ArrayList<SaettaLampegginante>();
}


void draw(){
    background(0);
    
    for(Saetta s : sa){
       s.run(); 
    }
    
    for(SaettaLampegginante s : sl){
       s.run(); 
    }
}

void mousePressed(){
  if(mouseButton == LEFT){
     sa.add(new Saetta(random(width))); 
  }
  else if(mouseButton == RIGHT){
    sl.add(new SaettaLampegginante(random(width))); 
  }
}

void keyPressed(){
   if(key == 'R' || key == 'r'){
      setup(); 
   }
}
