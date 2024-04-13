//Loop array di circonferenze che cambiano colore e si fermano con i tasti + vare funzioni 
float [] d = new float[10];
boolean go = true;
void setup(){
  size(800,800);
  frameRate(5);
  for(int i=0; i< d.length; i++){ //se utilizzasi questo for anche nel draw i cerchi verrebbero rappresentati uno sopra l'altro quindi vengono coperti perchè viene disegnato il primo più piccolo, il secondo più grande e così via crescendo
    d[i] = (i+1)*60; 
  }
}

void draw(){
  for(int i=d.length -1; i>=0; i--){ //leggo al contrario in modo tale che i vari cerchi non vengono coperti
    fill(random(255),random(255),random(255));
    ellipse(width/2, height/2, d[i], d[i]);
  }
  
  /*if(mousePressed){ //Se utilizzo queste funzioni e premo il tasto sinistro il loop finisce ma non riparte
    if(mouseButton == LEFT){ //perchè esco dalla funzione quindi se premo il destro non riparte il loop
        println("L"); 
        noLoop();  
     }
     
     if(mouseButton == RIGHT){
        println("R"); 
        loop();
     }
  }*/
  /*
  if(mousePressed){
     if(mouseButton == LEFT){
        println("L"); 
     }
     if(mouseButton == RIGHT){
        println("R"); 
     }
     if(mouseButton == CENTER){
        println("C"); 
     }
  }
  
    if(keyPressed){
     if(key ==  'a' || key == 'A'){
       println("Ho premuto a");
    }
  }
  */
  
}
//perchè utilizzare le funzioni anzichè le variabili booleane
//con le funzioni il problema sopra citato non viene attuato
void mousePressed(){ //mouse premuto
   /*
   if(mouseButton == LEFT){
       println("L"); 
       noLoop();  
     }
     
     if(mouseButton == RIGHT){
        println("R"); 
        loop();
     }
     */
}

void mouseReleased(){ //mentre viene premuto
}

void mouseClicked(){ //rilascio
  go = !go;
  if(go){
     loop();
  }else{
    noLoop();
  }
}

void keyPressed(){
}

void keyReleased(){
}

void keyTyped(){
}
