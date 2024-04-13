int d =40; //diametro di ogni cerchio
void setup(){
  size(500,500);
  background(0);
  noStroke();
 colorMode(RGB,width) ; // in questo caso 0 è il minimo 500 è il massimo 
}
void draw(){
  for(int y=d/2; y<=height; y+=d){ //colonne, y = d/2 per evitare che la sfera sia tagliata
    for(int x=d/2; x<=width; x+=d){ //righe
        if(d/2 > dist(x,y, mouseX, mouseY)){ //per controllare se sono dentro a un elementro, utilizzo la funzione dist
                                //Distanza(x, y, mouseX e mouseY, sono varaibili fisse di processing
           fill(x,y,255); 
        }else{
          fill(x,y,0); 
        }
        ellipse(x,y,d,d);
    }
  }
}
