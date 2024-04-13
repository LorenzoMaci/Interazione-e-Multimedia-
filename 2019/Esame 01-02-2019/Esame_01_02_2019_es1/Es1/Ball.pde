class Ball{
   float x, y;
   float r;
   float sy = 5;
   
   
   Ball(float x, float y, float r){
       this.x = x;
       this.y = y;
       this.r = r;
   }
   
   void display(){
      noStroke();
      fill(255,0,0);
      ellipseMode(CENTER);
      ellipse(x,y , r*2, r*2);
   }
   
   
   void move(){
      y += sy;
      if(y <= 0 || y >= height){
         sy *= -1; 
      }
   }
   
   void run(){
      display();
      move();
   }
}
