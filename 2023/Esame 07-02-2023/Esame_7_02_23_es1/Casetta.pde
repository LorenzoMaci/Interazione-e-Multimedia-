class Casetta extends Casa{
    int h = 10;
    Casetta(){
       super(); 
    }
    
    void display(){
      strokeWeight(3);
       stroke(255);
       noFill();
       rectMode(CENTER);
       rect(x, y, super.l, super.l);
      beginShape(TRIANGLES);
      vertex(x+15, y-15);
      vertex(x-15, y-15);
      vertex(x, y-30);
      endShape();
       rect(x, y +5, h, 20);
    }
    
    void move(){
       x += vx;
       if( x > width + l){
           x = 0;
       }
    }
    
    void run(){
      display();
      move();
   }
}
