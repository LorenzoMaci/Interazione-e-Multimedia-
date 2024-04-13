class Baloon{
   float x, y;
   float d = 50;
   
   Baloon(float x, float y){
      this.x = x;
      this.y = y;
   }
   
   void display(){
      noStroke();
      fill(255,0,0);
      ellipseMode(CENTER);
      ellipse(x, y, d, d);
   }
   
   
   void move(double e){
       x += e;
   }
   
   boolean range(){
      return x <= 10 || x >= width - d;
   }
   
   boolean hit(Spear s){
      if(dist(s.x, s.y + 40, x, y) < d/2){
          return true;
      }
      return false;
   }
   
   void run(double e){
      display();
      move(e);
   }
}
