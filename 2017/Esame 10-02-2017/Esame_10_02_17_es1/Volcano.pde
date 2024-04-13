class Volcano{
  float x,y;
  float h = 60;
  color c = (#934E24);
  
  Volcano(float x, float y){
     this.x = x;
     this.y = y;
  }  
  
  void display(){
     fill(c);
     quad(x+35, y, x, y + h, x + 120, y + h , x + 85, y);
  }
  
  FireBall generate(){
     FireBall gen = new FireBall(x+60, y, random(-2,2), random(-8, -2), random(5, 10));
     
     return gen;
  }
  
   void run(){
      display(); 
   }
}
