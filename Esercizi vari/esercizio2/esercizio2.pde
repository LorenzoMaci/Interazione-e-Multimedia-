//Esercizio che fa andare la linea da sinistra verso destra e da destra verso sinsitra
int pos = 0;
int dir = 1; //direzione se 1 (positiva) sinistra verso destra, -1 (negativa) destra verso sinistra
int v = 3; //velocità del fotogramma
void setup(){
  size(500,500);
  frameRate(100);

}

void draw(){
  background(255); //per utilizzare un unico foglio 
  line(pos, 0, pos, height);   
  if(pos >= width || pos < 0){ // pos < 0 per farlo andare da destra verso sinsitra
      dir = -dir;
  }
   pos += dir*v;
}
