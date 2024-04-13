class Pillow{
   float x, y;
   float w, h;
   float sx = 2;
   
   Pillow(float x, float y, float w, float h){
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
   }
   
   void display(){
      noStroke();
      fill(255);
      rectMode(CENTER);
      rect(x, y, w, h);
   }
   
   
   void move(){
      x += sx;
      if(x < 0 || x > width){
         sx *= -1; 
      }
   }
   
   
   void run(){
      display();
      move();
   }
}
