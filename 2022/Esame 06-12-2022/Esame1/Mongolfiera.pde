class Mongolfiera{
   float x, y;
   float sx = random(2,10);
   float l = 60, h = 30;
   float d = 70;
   
   Mongolfiera(float x, float y){
      this.x = x;
      this.y = y;
   }
   
   void display(){
      fill(0,255,0);
      ellipseMode(CENTER);
      ellipse(x, y, d , d);
      fill(100);
      rect(x - h, y + 50, l, h);
      line(x + 35,  y, x + 30, y + l);
      line(x - 35,  y, x - 30, y + l);
   }
   
   void move(){
     x += sx;
       if( x > width){
          x = 0; 
       }
   }
   
   void run(){
      display();
      move();
   }
}
