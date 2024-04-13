class Frog{
   float x, y;
   float vx, vy;
   
   
   Frog(float x, float y, float vx, float vy){
      this.x = x;
      this.y = y;
      this.vx = vx;
      this.vy = vy;
   }
   
   void display(){
      fill(0,255,0);
      noStroke();
      ellipse(x,y, 50, 70);
      
      fill(255,0,0);
      ellipse(x + 25, y - 20, 20, 20);
      ellipse(x - 25, y - 20, 20, 20);
      
   }
   
   void move(){
     vy += 0.2;
     x += vx;
     y += vy;
      if(x <= 0 || x >= width - 10){
         vx *= -1; 
      }
      if(y <= 0 || y >= height - 10){
         vy *= -1; 
      }
   }
   
   void check(){
      if(dist(mouseX, mouseY, x, y) < 25){
         vy = -7;
      }
   }
   
   void run(){
      move();
      display();
      check();
   }
}
