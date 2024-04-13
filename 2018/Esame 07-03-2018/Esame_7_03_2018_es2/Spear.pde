class Spear{
   float x, y;
   float vy;
   
   Spear(float x, float y, float vy){
       this.x = x;
       this.y = y;
       this.vy = vy;
   }  
   
   void display(){
        fill(#1DC7F0);
        noStroke();
        triangle(x, y+40, x + 15, y, x-15, y);
     }
     
     void move(){
        y += vy; 
        if(y == height){
           y = 0; 
        }
     }
     
     void run(){
        display();
        move();
     }
}
