PImage rev(PImage img){
   
   int x = img.width;
   int y = img.height;
   PImage r  = createImage(x, y, RGB);
   //Copio la seconda metà dell'immagine originale nella prima metà dell'immagine di output
   r.copy(img, x/2, 0, x/2, y, 0, 0, x/2, y);
   
   //Copio la prima metà dell'immagine originale nella seconda metà dell'immagine di output
   r.copy(img, 0, 0, x/2, y, x/2, 0 , x/2 , y);
   
   color c = color(random(255), random(255),random(255));
   for(int i=0; i<width; i++){
      r.set(i, i, c); 
   }
   return r;
}

PImage img;

void setup(){
  size(512,256);
  
  img = loadImage("lena.png");
  img.resize(256,256);
  
}

void draw(){
   image(img, 0, 0);
   
   PImage img1 = rev(img);
   image(img1, width/2, 0);
   
}
