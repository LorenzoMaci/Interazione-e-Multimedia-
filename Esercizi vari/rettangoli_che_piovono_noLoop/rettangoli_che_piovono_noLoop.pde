float[] y = new float[1000];

void setup(){ //eseguiamo solo una volta ricorda
   size(500,500); //dimenzione cambas
   noStroke(); //Senza bordo i rettangoli
   fill(random(255), random(255), random(255), random(255)); //i colori sono randomici quando riapro il programma, ultimo random trasparenza ricorda
   for(int i=0; i<y.length; i++){ //inizializzo questo array mettendo i valori random in y
     y[i] = random(-1000, 200); //y molto negativo per far si che iniziano da fuori schermo fino ad arrivare nella cambas
   }
   frameRate(120);
}

void draw(){
  background(255);
  for(int i=0; i<y.length; i++){
     y[i]++;
     float x = i * 0.5;
     rect(x,y[i], 20,30);
  }
}
