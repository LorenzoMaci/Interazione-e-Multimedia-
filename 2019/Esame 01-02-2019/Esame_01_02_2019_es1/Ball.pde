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
      ellipse(x,y, r*2, r*2);
   }
   
   void move(){
       if(y > height || y < 0){
          sy *= -1; 
       }
       y += sy;
   }
   
   void run(){
      move();
      display();
   }
}
