class Smoke{
   float x, y;
   float vy;
   float d;
   color c;
   
   Smoke(float x, float y, float vy, float d, color c){
      this.x = x;
      this.y = y;
      this.vy = vy;
      this.d = d;
      this.c = c;
   }
   
   void move(){
      y -= vy;
     
   }
   
   void display(){
      fill(c);
      ellipse(x, y, d, d);
   }  
   
   void run(){
      move();
      display();
   }
}
