int q = 31651;
int f(int q){
   return ((q%21)/80); 
}

class Heart{
   float x, y;
   float sx, sy;
   boolean alive = true;
   
   
   Heart(float x, float y, float sx, float sy){
      this.x = x;
      this.y = y;
      this.sx = sx;
      this.sy = sy;
   }
   
  void display(){
    noFill();
    rectMode(CENTER);
    stroke(255);
    strokeWeight(2);
    rect(x, y, 60, 60);
    noStroke();
    if(alive)
    fill(255, 50, 50);
    else
    fill(150);
    bezier(x, y-15, x-30, y-25, x-30, y-25, x, y+25);
    bezier(x, y-15, x+30, y-25, x+30, y-25, x, y+25);
  }
  
   
   void move(){
      if(!alive){
         y -= 0.1 + f(q); 
      }
      y -= sy;
      x += sx;
   }
   
  void mouseIn(){
     if(dist(x,y,mouseX, mouseY) < 30){
        alive = false; 
     }
  }
  
   void run(){
      move();
      display();
   }
}
