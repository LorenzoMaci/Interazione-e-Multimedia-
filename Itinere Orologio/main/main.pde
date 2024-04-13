Orologio orologio;

void setup() {
  size(500, 500);
  frameRate(1);
  orologio = new Orologio(width/2.0, height/2.0, 120.0, int(random(0,60)), int(random(0,60)), int(random(0, 12)));
}

void draw(){
   background(0);
   fill(255);
   orologio.incrementTime();
   orologio.display();
}

void keyPressed(){
   if(key == '+' && frameRate<60){
     frameRate(frameRate++);
     print("frameRate increment " + frameRate);
   }else if(key == '-' && frameRate > 1){
      frameRate(frameRate--); 
      print("frameRate deìiminuito " + frameRate);
   }
}
