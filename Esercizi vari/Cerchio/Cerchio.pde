class Orologio{
    float x, y, diametro;
    Orologio(float x, float y, float diametro){
       this.x = x;
       this.y = y;
       this.diametro = diametro;
    }   
    
  void display() {
    strokeWeight(2);
    stroke(0, 255, 0);
    fill(255);
    ellipse(x,y, diametro, diametro);
  
    drawLancetta(x, y, second(), radians(360/60), 50, color(0));
    drawLancetta(x, y, minute(), radians(360/60), 40, color(255,0,0));
    drawLancetta(x, y, hour() % 12 , radians(360/12), 30, color(0, 0 , 255));
  }
  
  void drawLancetta(float x, float y, int value, float angleU, float length, color col){
      float angle = -HALF_PI + value * angleU;
      float endX = x + cos(angle) * length;
      float endY = y + sin(angle) * length;
      
      strokeWeight(3);
      stroke(col);
      line(x,y,endX, endY);
  }
}
