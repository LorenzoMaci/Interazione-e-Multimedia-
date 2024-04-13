int pos1 = 0;
void setup(){
  size(500,500);
  frameRate(200);

}

void draw(){
  background(255); //per utilizzare un unico foglio 
  line(pos1, 20, pos1, height);   
  
  pos1+=3; //incremento di uno perchè cosi arriviamo a 500 precisi. +3 = 3 pixel al fotogramma
          //da sinistra verso destra
  
  if(pos1 >= width){ //eccetto se vogliamo velocizzare mettiamo pos>= 
     pos1 = 0; 
  }
}
