class Warp{
   float x;
   float y;
   color colore;
   float a;
   float pow;
   
   Warp(float x, float y, color colore, float a, float pow){
      this.x = x;
      this.y = y;
      this.colore = colore;
      this.a = a;
      this.pow = pow;
   }
   
   void display(){
      fill(0);
      ellipse(x, y, 70, 70);
      fill(70);
      ellipse(x,y,60, 60);
      fill(colore);
      ellipse(x,y,50, 50);
   }
   
   void shot(){
     float bulletSx = cos(radians(a))* pow;
     float bulletSy = sin(radians(a))* pow;
     Bullet nbullets = new Bullet(x,y, bulletSx, bulletSy, colore);
     bullets.add(nbullets);
   }
   
   boolean mouseCheck(){
       float d = dist(mouseX, mouseY, x, y);
       if(d < 25){
         return true;
       }
       return false;
   }
}
