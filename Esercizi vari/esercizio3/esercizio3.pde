//matonelle a forma quadratica con pezzi di grigio e rumore
size(500, 500);
background(0,255,0);
noStroke();

int l = 50; //lato matonella ricorda (quadrato)

for(int y = 0; y< height; y+=l){ //serve a replicare
 for(int x = 0; x<width; x+=l){ // il padre replica la riga
   fill(random(255),130); // per il grigio random(255) tonalità di grigio casuale, il 130 sono coprenti 130 su 255
     rect(x + random(-5,5),y+random(-5,5), l, l);//il random serve a mettere rumore tra la x e la y
 }
}
