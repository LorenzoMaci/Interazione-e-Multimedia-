class Bucket{
    float posx = 250, posy = height-50, h = 40, bmin = 30, bmag = 50;
  
    Bucket(){}
    
    void display(){
        fill(#470A00);
        quad(mouseX - (bmin/2), posy, mouseX+(bmin/2), posy, mouseX + (bmag/2), posy-h, mouseX-(bmag/2),posy-h);
    }
    
    void run(){
       display(); 
    }
    
    void checkDist(Egg g){
       if(dist(mouseX+25, posy-5, g.x, g.y) <= h){
          g.state = false; 
       }
    }
    
    
}
