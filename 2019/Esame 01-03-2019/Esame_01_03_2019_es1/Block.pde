class Block{
   float x, y;
   float w, h;
   float sx = 4;
   
   Block(float x, float y, float w, float h){
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
   }
   
   void display(){
      noStroke();
      fill(0,255,0);
      rect(x, y, w, h);
   }
   
  void move(){
    if(x>width || x<0)
      sx*=-1;

    x+=sx;
  }
   
   void run(){
      display();
      move();
   }
}
