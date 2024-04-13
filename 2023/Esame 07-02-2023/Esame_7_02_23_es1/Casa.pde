class Casa{
   float x, y;
   float vx;
   float l = 30;
   
   Casa(){
       this.x = int(random(width - l));
       this.y = int(random(height));
       this.vx = random(2,10);
   }
   
   void display(){
      strokeWeight(3);
      stroke(255,255,0);
      noFill();
      rectMode(CENTER);
      rect(x, y, l, l);
      triangle(x + 15, y - 15, x , y - 30, x - 15, y - 15);
   }
   
   void move(){
     x -= vx;
     if( x <= l || x >= width -l){
         vx *= -1;
     }
   }
   
   void run(){
      display();
      move();
   }
}
