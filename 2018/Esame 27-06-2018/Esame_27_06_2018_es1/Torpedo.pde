class Torpedo{
   float x, y;
   float vx;
   
   Torpedo(float x, float y, float vx){
       this.x = x;
       this.y = y;
       this.vx = vx;
   }
   
   void move(){
      x += vx;
   }
   
   void display(){
      stroke(0);
      fill(160,0,0);
      rect(x,y - 10, 100, 20);
      stroke(0);
      fill(160,0,0);
      ellipse(x+100, y, 20, 20);
   }
   
   void smoke(){
      float d = random(10,30);
      float vy = d/5;
      color c = color(random(100,180));
      Smoke news = new Smoke(x -5 , y, vy, d, c);
      sm.add(news);
   }
   
   void run(){
      display();
      move();
   }
}
