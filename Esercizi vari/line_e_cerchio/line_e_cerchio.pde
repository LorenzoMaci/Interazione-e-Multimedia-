int pos = 0;
int yc = 0;
int b = 255; //background
int dir = 1; //direzione destra sinistra sopra e sotto
int v = 4; //velocità
void setup(){
   size(500, 500);
   frameRate(60);
}

void draw(){
   background(b);
   line(pos, 0, pos, height);
   pos+=v *dir;
   if(pos >= width || pos < 0){
      dir = -dir; 
   }
   ellipse(width/2, yc, 30, 30);
   if(yc > height){
      yc = 0; 
   }
   yc+=v*dir;
}
