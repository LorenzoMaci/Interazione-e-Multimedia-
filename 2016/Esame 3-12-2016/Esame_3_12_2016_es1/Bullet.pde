
class Bullet{
  float x;
  float y;
  float sx; //velocità sinistra
  float sy; 
  color colore;
  
  Bullet(float x, float y, float sx, float sy, color colore){
     this.x = x;
     this.y = y;
     this.sx = sx;
     this.sy = sy;
     this.colore = colore;
  }
    
  void move(){
     x += sx;
     y += sy;
  }
  void display(){
     fill(colore);
     noStroke(); 
     ellipse(x, y, 20, 20);
  } 
}
