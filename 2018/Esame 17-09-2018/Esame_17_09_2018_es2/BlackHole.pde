class BlackHole{
   float x, y;
   float d = 50;
 
   BlackHole(float x, float y){
      this.x = x;
      this.y = y;
   }
   
   void display(){
      noStroke();
      fill(0);
      ellipse(x,y,d,d);
   }
   
   void move(){
      x = mouseX;
      y = mouseY;
   }
   
   void check(ArrayList<Asteroid> A){
       for(int i=0; i<A.size(); i++){
          if(dist(A.get(i).x, A.get(i).y, x, y) < d/2){
             A.remove(A.get(i));
             d++;
          }
       }
   }
   
   void run(ArrayList<Asteroid> A){
      display();
      move();
      check(A);
   }
}
