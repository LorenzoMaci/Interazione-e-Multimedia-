void setup(){ //funzione di defult e mettiamo le istruzioni per l'avvio del nostro programma
  println("Sono nel setup"); //framerate di defult è 60
  frameRate(30); //frame count è una variabile che processing in ogni istante aggiorna contanto qunati fotogrammi sono passatti dall'inizio dell'esecuzione
  background(0);
}
void draw(){ //ciclo infinito simile al while(true)
  println("Sono nel draw " + frameCount + " frame sono passati");
  if(frameCount > 150){ //dopo 5 secondi voglio che compaia un pallino al centro 5 secondi per 30 fotogrammi al secondo = 150
     ellipse(width/2, height/2, 50, 50);  
  }
}
