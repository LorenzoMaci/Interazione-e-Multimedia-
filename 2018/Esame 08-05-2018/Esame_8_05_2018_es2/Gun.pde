class Gun{
   float x, y;
   float h = 70;
   float b = 20;
   
   Gun(){}
   
   void display(){
      rectMode(CENTER);
      fill(150);
      rect(mouseX, height - 35, b, h);
   }
   
   Bullet shot(){
      return new Bullet(mouseX, float(height - 70)); 
   }
   
   void run(){
      display(); 
   }
}
