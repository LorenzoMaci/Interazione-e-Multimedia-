class Votone extends Voto{
   Votone(){
      super(); 
   }
   
   void display(){
      noFill();
      strokeWeight(3);
      stroke(255);
      rectMode(CENTER);
      rect(super.x, super.y, super.l, super.l);
      fill(255);
      textSize(28);
      text(number, x-13, y +10);
      text("LODE", super.x, super.y+30);
   }
   
   void run(){
      if(super.number > 24){
        display();
     }
   }
}
