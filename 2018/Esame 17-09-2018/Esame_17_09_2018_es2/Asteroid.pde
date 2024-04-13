class Asteroid{
    float x, y;
    float h;
    
    Asteroid(float x, float y, float h){
        this.x = x;
        this.y = y;
        this.h = h;
    }
    
    void display(){
       noStroke();
       fill(#98460F);
       ellipse(x,y, h, h);
    }
    
    void move(BlackHole B){
       float s = dist(this.x, this.y , B.x, B.y);
       
       float sx = -(this.x - B.x)/s;
       float sy = -(this.y - B.y)/s;
       
       sx *= 3;
       sy *= 3;
       
       x += sx;
       y += sy;
    }
    
    void run(BlackHole B){
       display();
       move(B);
    }
}
