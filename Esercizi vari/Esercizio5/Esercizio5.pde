//QUADRATO CHE SI MUOVE CON LEFT E RIGHT
int x = 20;
void setup(){
   size(800,800); 
}

void draw(){
   background(0);
   rect(x, height/2, 50, 50);
    if(key == CODED){ //All'interno di key troviamo il carattere speciale CODED 
    if(keyCode == LEFT){
       x-=5; //va a sinistra
    }
    else if(keyCode == RIGHT){
      x+=5;
    }
  }
}

void keyPressed(){
  /*
  if(key == CODED){ //All'interno di key troviamo il carattere speciale CODED 
    if(keyCode == LEFT){
       x-=5; //va a sinistra
    }
    else if(keyCode == RIGHT){
      x+=5;
    }
  }
  */ //in questo caso più lento ecco perchè scritto sopra
}

void keyReleased(){
}

void keyTyped(){
}
