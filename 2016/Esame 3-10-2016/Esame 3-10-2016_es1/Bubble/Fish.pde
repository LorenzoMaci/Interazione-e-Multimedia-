class Fish{
   float x, y; //posizione
   float vx, vy; //velocità
   color c;
   
   Fish(float x, float y, float vx, float vy, color c){
      this.x = x;
      this.y = y;
      this.vx = vx;
      this.vy = vy;
      this.c = c;
   }
   
   void display(){
     fill(0);
     ellipse(x, y, 80, 50);
     
     triangle(x - 40, y, x - 40, y - 40, x, y - 20);
     
     fill(0);
     ellipse(x + 30, y + 30, 5, 5);
   }
   
   void move(){
       x += vx;
       y += vy;
       
       if(x > width){
          x = 0; 
       }
   }
     Bubble generateBubble() {
    float bubblex = x + 40;
    float bubbley = y - 20;
    float bubbled = random(10, 30);
    float bubblespeed = bubbled * 0.1;

    return new Bubbles(bubblex, bubbley, bubblespeed, bubbled);
  }
}
