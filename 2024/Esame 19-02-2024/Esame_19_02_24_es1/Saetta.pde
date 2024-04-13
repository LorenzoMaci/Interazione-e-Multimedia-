class Saetta{
   float x;
   float y = 0;
   float sy = random(2,10);
   float h = 80;
   float l = 20;
   
   Saetta(float x){
      this.x = x;
   }

   
   
   void display(){
      fill(#FFFF00);
      triangle(x, y, x, y - h/2, x - l/2, y);
      triangle(x, y, x, y + h/2, x + l/2, y);
   }  
   
   void move(){
      x += random(-5,5);
      y += sy;
      if( y >= height -10){
         y = 0;  
      }
   }
   
   void run(){
     move();
     display();
  }
}
