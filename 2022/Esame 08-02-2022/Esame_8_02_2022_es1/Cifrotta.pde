class Cifrotta extends Cifra{
   
   Cifrotta(float x, float y, char c){
      super(x,y,c); 
   }
   
   void display(){
      noFill();
      stroke(255);
      ellipseMode(CENTER);
      ellipse(x,y, dim, dim);
      fill(255);
      textSize(32);
      text(ct, x - 8, y + 12); 
   }
   
   void move(){
      y -= vy;
      if(y <= 0){
        y = height; 
      }
   }
   
   void run(){
      display();
      move();
   }
}
