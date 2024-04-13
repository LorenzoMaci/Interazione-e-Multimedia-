PImage img;
int s = 2;

void setup(){
   size(512,256);
   
   img = loadImage("lena.png");
   img.filter(GRAY);
   img.resize(256, 256);
   
}

void draw(){
    background(255);  
    
    //visualizza immagine originale a sinistra
    image(img, 0, 0);
    
    PImage filter = jonnyFilter(img, s);
    
    //visualizza l'immagine converita a destra
    image(filter, img.width , 0);
    
    textSize(14);
    text(" S = " + s, width - 70 ,50 );
}


void keyPressed(){
   if(key == '+' && s < 9){
       s++;
   }
   if(key == '-' && s > 2){
      s--; 
   }
}
