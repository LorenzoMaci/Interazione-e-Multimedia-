class Orologio{
    float x, y, diametro;
    int ore, minuti, secondi;
    Orologio(float x, float y, float diametro, int ore, int minuti, int secondi){
       this.x = x;
       this.y = y;
       this.diametro = diametro;
       this.ore = ore % 12;
       this.minuti = minuti % 60;
       this.secondi = secondi % 60;
    }   
    
  void display() {
    strokeWeight(2);
    stroke(0, 255, 0);
    fill(255);
    ellipse(x,y, diametro, diametro);
  
    drawLine(secondi, 60, color(0));
    drawLine(minuti, 60, color(255, 0, 0));
    drawLine(ore, 12, color(0, 0, 255));
  }
  
   void incrementTime(){
      secondi++;
      if(secondi == 60){
         secondi = 0;
         minuti++;
      }
      else if(minuti == 60){
         minuti = 0;
         ore = (ore++) % 12;
      }
   }
   
   void drawLine(int valore, int maxTime, color colore){
      float angolo = map(valore, 0, maxTime, 0, TWO_PI) - HALF_PI;
      float lunghezza = 0;
      if(colore == color(0)){
         lunghezza = 50;
         strokeWeight(1);
      }
      else if(colore == color(255, 0, 0)){
         lunghezza = 40;
         strokeWeight(2);
      }
      else if(colore == color(0, 0, 255)){
         lunghezza = 30;
         strokeWeight(3);
      }
      float x2 = x + cos(angolo) * lunghezza;
      float y2 = y + sin(angolo) * lunghezza;
      stroke(colore);
      line(x,y, x2, y2);
   }
}
