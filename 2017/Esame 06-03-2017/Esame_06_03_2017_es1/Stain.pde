class Stain{
   float x, y;
   float D;
   color colore;
   
   Stain(float x, float y, float D, color colore){
      this.x = x;
      this.y = y;
      this.D = D;
      this.colore = colore;
   }
   
    void display(){
       fill(colore);
       noStroke();
       ellipse(x, y, D, D);
    }
   
   void move(){
      x += random(-1, 1);
      y += random(0, 4);
    }
   
   void run(){
      display();
      move();
   }
   
}
