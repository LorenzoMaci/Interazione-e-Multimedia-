class SuperPillow extends Pillow{
   int angle = int(random(0, 360));
   
   SuperPillow(float x, float y, float w, float h){
      super(x, y, w, h); 
   }
   
   void display(){
      pushMatrix();
      translate(x,y);
      rotate(radians(angle));
      
      fill(255);
      noStroke();
      rectMode(CENTER);
      rect(0,0,w,h);
      
      fill(100);
      ellipse(0,0, w, w);
      popMatrix();
     
     if(dist(mouseX, mouseY,  x, y) <= w/2){
         angle += 5;
     }
   }
   
   void run(){
      this.display();
      super.move();
   }
}
