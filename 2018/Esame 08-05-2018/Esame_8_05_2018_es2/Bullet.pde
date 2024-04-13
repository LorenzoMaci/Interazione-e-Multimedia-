class Bullet{
   float x, y;
   float vy = 10;
   float d = 10;
   
   Bullet(float x, float y){
      this.x = x;
      this.y = y;
   }
   
   void display(){
      noStroke();
      fill(#B600FF);
      ellipse(x,y, d, d);
   }
   
   void move(){
      y -= abs(vy);
   }
   
   void run(){
      display();
      move();
   }
}
