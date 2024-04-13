class MongolfieraMotorizzata extends Mongolfiera{
    
    MongolfieraMotorizzata(float x, float y){
       super(x,y); 
    }
    
    void display(){
      fill(random(255));
      ellipseMode(CENTER);
      ellipse(x, y, d , d);
      fill(100);
      rect(x - h, y + 50, l, h);
      line(x + 35,  y, x + 30, y + l);
      line(x - 35,  y, x - 30, y + l);
    }
    
    void move(){
       x += sx / 2;
       if( x < 35 || x > width - 35){
          sx *= -1; 
       }
    }
    
    void run(){
       display();
       move();
    }
}
