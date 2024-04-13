class FireBall{
    float x, y;
    float vx, vy;
    float D;
    
    FireBall(float x, float y, float vx, float vy, float D){
       this.x = x;
       this.y = y;
       this.vx = vx;
       this.vy = vy;
       this.D = D;
    }
    
    void move(){
       x += vx;
       y += vy;
       y -= abs(0.1);
    }
    
    void display(){
       noStroke();
       fill(180,0,0);
       ellipseMode(CENTER);
       ellipse(x,y, D, D);
    }
    
    void run(){
       display();
       move();
    }
}
