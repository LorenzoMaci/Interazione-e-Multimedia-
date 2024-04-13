class Cifra{
   float x, y;
   float vy =  random(2,10);
   float dim = 32;
   char ct;
   
   
   Cifra(float x, float y, char ct){
      this.x = x;
      this.y = y;
      this.ct = ct;
   }
   
   void move(){
      y += vy; 
      if(y >= height){
        y =  0;
      }
   }
   
   void display(){
      fill(255,255,0);
      textSize(32);
      text(ct, x, y); 
   }
   
   void run(){
      display();
      move();
   }
}
