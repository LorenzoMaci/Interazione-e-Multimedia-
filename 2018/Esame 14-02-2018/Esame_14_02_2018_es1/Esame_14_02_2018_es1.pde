ArrayList<Heart> he;

void setup(){
   size(512,512);
   frameRate(30);
   smooth();
   he = new ArrayList<Heart>();
}

void draw(){
  fill(10,10, 80, 20);
  rect(0,0, width*2, height*2);
  if(random(1) < 0.5){
     he.add(new Heart(random(50, width -50), height + 50, random(-5, 5), random(3,7))); 
  }
  
  for(Heart h : he){
     h.run();
     if(mousePressed && h.alive){
         h.mouseIn();
     }
  }
}  

void keyPressed(){
   if(key == 'r'){
      setup(); 
   }
}
