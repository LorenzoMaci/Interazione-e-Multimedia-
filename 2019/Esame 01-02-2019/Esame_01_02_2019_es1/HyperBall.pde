class HyperBall extends Ball{
   color c = color(0,0,255);
   
   HyperBall(float x, float  y, float r){
      super(x, y,r);     
   }
   
   void checkMouse(){
      if(dist(mouseX,mouseY, x, y) <= r){
          c = color(random(255), random(255),random(255));
      }
   }
   
   void display(){
      noStroke();
      fill(c);
      ellipse(x,y,r*2,r*2);
   }
   
   void move(){
      super.move(); 
   }
   
   void run(){
      move();
      display();
      checkMouse();
   }
}
