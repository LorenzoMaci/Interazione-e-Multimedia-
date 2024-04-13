class Asteroid{
   float x,y;
   float vx, vy;
   boolean state = true;
   float d = 50;
   
   Asteroid(float x, float y, float vx, float vy){
      this.x = x;
      this.y = y;
      this.vx = vx;
      this.vy = vy;
   }
   
   void display(){
     if(state){
       fill(200,0,0);
     }else{
      fill(#787878, 190); 
     }
      stroke(255, 255, 0);
      strokeWeight(5);
      ellipse(x, y, d, d);
   }
   
   void move(){
     if(state == false){
         y += abs(0.2); 
      }else{
        x += vx;
        y += vy;
      }
   }
   
  void hit(Bullet b){
  float distance = dist(b.x, b.y, x, y); 
    if(distance < d / 2 && state) { 
      state = false; 
    }
  }

   void run(){
     display();
     move();       
   }
}
