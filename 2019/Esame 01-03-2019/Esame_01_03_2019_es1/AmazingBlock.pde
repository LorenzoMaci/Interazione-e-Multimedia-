class AmazingBlock extends Block{
    int angle = int(random(360));
    
    AmazingBlock(float x, float y, float h, float w){
       super(x,y,h,w);
    }
    
    void display(){
       noStroke();
       fill(angle%256, 255-angle%256,255);
       rectMode(CENTER);
       pushMatrix();
       translate(x, y);
       rotate(radians(angle));
       rect(0,0, w, h);
       popMatrix();
       
       angle += 5;
    }
    
    void run(){
       this.display();
       super.move();
    }
}
