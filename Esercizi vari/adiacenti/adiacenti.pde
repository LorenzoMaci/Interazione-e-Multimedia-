size(500,500);
background(0);
noStroke();
int d =40; //diametro di ogni cerchio 
for(int y=d/2; y<=height; y+=d){ //colonne, y = d/2 per evitare che la sfera sia tagliata
  for(int x=d/2; x<=width; x+=d){ //righe
      ellipse(x,y,d,d);
  }
}
