class Sponge{
    float x, y;
    float L;
    color colore = color(200, 200,200);
    
    Sponge(float x, float y, float L){
      this.x = x;
      this.y = y;
      this.L = L;
    }
    
    void display(){
       fill(colore);
       noStroke();
       rectMode(CENTER);
       rect(x,y, L,L);
    }
    
    void move(){
       x = mouseX;
       y = mouseY;
    }
    
    boolean adsorb(Stain s){
      if(dist(mouseX, mouseY, s.x, s.y) < L/2){
         L += (s.D/2); 
         float r,g,b;
         r = (red(colore) + red(s.colore))/2;
         g = (green(colore) + green(s.colore))/2;
         b = (blue(colore) + blue(s.colore))/2;
         
         this.colore = color(r,g,b);
         return true;
      }
      return false;
    }
    
   void run(){
      display();
      move();
   }
}
