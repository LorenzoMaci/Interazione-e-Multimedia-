class Voto{
   float x, y;
   float vx;
   int voto = int(random(18,30));
   
   Voto(float x, float y, float vx){
      this.x = x;
      this.y = y;
      this.vx = vx;
   }
   
   void display(){
      strokeWeight(3);
      noFill();
      stroke(255,255,0);
      rectMode(CENTER);
      rect(x, y , 30, 30);
      textSize(28);
      text(voto, x - 14 ,y + 12);
   }
   
   
   void move(){
      x += vx;
      if( x > width || x < 0){
         vx *= -1; 
      }
   }
   
   void run(){
      display();
      move();
   }
}
