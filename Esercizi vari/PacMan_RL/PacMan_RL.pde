//PACMAN CHE VA A DESTRA E SINISTRA
int dirX = 1; //perchè diminuisce e aumenta di 1 destra/sinsitra
int dirY = 1; //sopra e sotto
int a = 30; //angolo
int dirA = -1; //decresce 
int v = 4; //velocità di movimento
int va = v/2; //velocità angolo;
int x = 60; //coordinata x
int y = 250; //Cordinata y
int r = 40; // raggio circonferenza
void setup(){
  size(500, 500);
  ellipseMode(RADIUS);
}
 //PACMAN SI MUOVE TRAMITE IL RAGGIO CIOE' il suo moviemento è mezzo diametro
void draw(){
  background(0);
  fill(255, 255, 0);
   if(dirX == 1){
    arc(x, height/2, r,r, radians(a), radians(360-a)); //radians di a +30° radians di (360° - 30°)
   }
   if(dirX == -1){ //qui deve girare la faccia di pacman quindi l'angolo di inizio e fine cambiano
     arc(x, height/2, r,r, radians(180+a), radians(360 + 180 -a));
   }
   
   fill(0);
   ellipse(x, height/2 -20, 5, 5);
   
    if(x >= width-r || x <= r){
      dirX = -dirX;
    }
    if(y >= height - r || y <=r){
       dirY  = -dirY; 
    }
     if(a > 30 || a <= 0){
        dirA = -dirA; 
     }
     a += dirA * va;
     x += dirX*v;
     y += dirY*v;
}

void keyPressed() {
  if (keyCode == RIGHT) {
    dirX = 1;
    dirY = 0;
  } 
  else if (keyCode == LEFT) {
    dirX = -1;
    dirY = 0;
  } 
  else if (keyCode == UP) {
    dirY = -1;
    dirX = 0;
  } 
  else if (keyCode == DOWN) {
    dirY = 1;
    dirX = 0;
  }
}
