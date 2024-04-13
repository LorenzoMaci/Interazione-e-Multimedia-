//esercizio dove i rettangoli piovono di continuo in loop 
float[] y;
void setup(){ //eseguiamo solo una volta ricorda
   size(900,900); //dimenzione cambas
   noStroke(); //Senza bordo i rettangoli
   y =  new float[width*2];
   fill(random(255), random(255), random(255), random(255)); //i colori sono randomici quando riapro il programma, ultimo random trasparenza ricorda
   for(int i=0; i<y.length; i++){ //inizializzo questo array mettendo i valori random in y
     y[i] = random(-2*height, 200); //y molto negativo per far si che iniziano da fuori schermo fino ad arrivare nella cambas
   }
   frameRate(180);
}

void draw(){
  background(255);
  for(int i=0; i<y.length; i++){
    y[i]++;
    if(y[i] > height){ 
      y[i] = random(-1000,-30); 
    }
     float x = i * 0.5;
     rect(x,y[i], 20,30);
  }
}
