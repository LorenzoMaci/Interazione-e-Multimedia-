Ball ba;
HyperBall hy;

void setup(){
    size(512,256);
  
    ba = new Ball(int(random(256)), int(random(256)), 40);
    hy = new HyperBall(int(random(256)), int(random(256)), 40);

}

void draw(){
   background(0);
   ba.run();
   hy.run();
}

void keyPressed(){
    if(key == 'R' || key == 'r'){
       setup(); 
    }
}
