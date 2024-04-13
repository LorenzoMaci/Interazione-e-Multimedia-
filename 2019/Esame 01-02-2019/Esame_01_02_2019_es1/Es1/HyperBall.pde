class HyperBall extends Ball{
   color c = color(0,0,255);
   
   HyperBall(float x, float y, float r){
      super(x,y,r); 
   }
   
   void display(){
     noStroke(); 
     fill(c); 
     ellipseMode(CENTER);
     ellipse(x,y, r*2, r*2);
   }
   
   void changeColor(){
      if(dist(mouseX, mouseY, x, y) <= r){
         c = color(random(255),random(255),random(255)); 
      }
   }
   
   void run(){
      this.display();
      super.move();
      changeColor();
   }
}
