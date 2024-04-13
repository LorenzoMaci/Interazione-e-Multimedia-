class Voto{
   float x,y;
   float vx;
   float l = 30;
   int number;
   

   
   Voto(){
      this.x = random(width);
      this.y = random(height);
      this.vx = random(2,10);
      this.number = int(random(18, 30));
   }
   
   void display(){
       noFill();
       strokeWeight(3);
       stroke(255,255,0);
       rectMode(CENTER);
       rect(x,y, l,l);
       textSize(28);
       text(number, x - 13, y + 10);
   }
   
   void move(){
      x += vx;
      if( x < 0 || x > width - 20){
          vx *= -1;
      }
   }
   
   void run(){
      display();
      move();
   }
}
