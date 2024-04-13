class Egg{
   float x, y;
   float sy;
   boolean state = true;
   
   Egg(float x, float y, float sy){
      this.x = x;
      this.y = y;
      this.sy = sy;
   }
   
   void move(){
      y += sy; 
   }
   
   void display(){
      noStroke();
      fill(255);
      ellipse(x, y, 30, 40);
   }
   
    void run(){
       if(state){
          display();
          move();
       }
    }
}
