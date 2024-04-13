class Votone extends Voto{
   
  Votone(float x, float y,float vx){
    super(x,y,vx); 
  }
  
   void display(){
     if(voto > 24){
        strokeWeight(3);
        noFill();
        stroke(255);
        rectMode(CENTER);
        rect(x, y , 30, 30);
        textSize(28);
        text(voto, x - 14 ,y + 12);
        text("LODE", x - 14, y + 35);
     }
   }
   
   void move(){
      vx = 0;
   }
}
