ArrayList<Frog> f;

void setup(){
   size(512,512);
   frameRate(60);
   
   f = new ArrayList<Frog>();
}  

void draw(){
   background(255);
   for(Frog fr : f){
      fr.run(); 
   }
}

void keyPressed(){
    if(key == 'F' || key == 'f'){
       f.add(new Frog(random(50,450), random(50, 450), random(-3, 3), random(-3,3))); 
    }
    
    if(key == '+' && frameRate <= 300){
       frameRate++; 
    }else if(key == '-' && frameRate >= 5){
       frameRate--; 
    }
    
    if(key == 'r' || key == 'R'){
       setup(); 
    }
}
