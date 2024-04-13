PImage sBlock(PImage img, int h){
    PImage R = img.copy();
    R.loadPixels();
    
    //realizzare due quadrati casuali 
    int w = img.width; //lunghezza immagine
    int he = img.height; //Altezza immagine
    
    int x1 = int(random(h/2, w - h/2)); //posizione primo quadrato
    int y1 = int(random(h/2, he - h/2)); 
    int x2 = int(random(h/2, w - h/2)); //posizione secondo quadrato
    int y2 = int(random(h/2, he - h/2));
    
    for(int y = 0; y < he; y++){
       for(int x = 0; x < w; x++){
          int i = x + y * w; //indice dell'immagine
          //colora i pixel dei quadrati in azzurro 
          if((x >= x1 - h/2 && x <= x1 + h/2 && y >= y1 - h/2 && y <= y1 + h/2) || 
             (x >= x2 - h/2 && x <= x2 + h/2 && y >= y2 - h/2 && y <= y2 + h/2)){
             R.pixels[i] = color(0, 230, 255); 
          }
       }
    }
    R.updatePixels();
    return R;
}

//Foward mapping
PImage sBlock(PImage img, int h, float s){
    PImage r = sBlock(img, h);
    
    PImage scaled = createImage(int(img.width*s), int(img.height*s), RGB);
    scaled.loadPixels();
    for(int y = 0; y< scaled.height; y++){
       for(int x = 0; x < scaled.width; x++){
          int forwardx = int(x/s);
          int forwardy = int(y/s);
          if(forwardx < img.width && forwardy < img.height){
             int i = forwardx + forwardy * img.width; 
             scaled.pixels[x + y * scaled.width]  = r.pixels[i]; 
          }else{
             scaled.pixels[x + y * scaled.width] = color(0);
          }
       }
    }
    scaled.updatePixels();
    return scaled;
}

//invere mapping
PImage sBloc(PImage img, int h, float s) {
  PImage result = sBlock(img, h); // Applica prima la colorazione dei quadrati
  
  // Applica l'operazione di scaling con inverse mapping
  PImage scaledResult = createImage(img.width, img.height, RGB); // Immagine di dimensioni originali
  scaledResult.loadPixels();
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int newX = int(x * s);
      int newY = int(y * s);
      if (newX < scaledResult.width && newY < scaledResult.height) {
        int newIndex = newX + newY * scaledResult.width;
        int origIndex = x + y * img.width;
        scaledResult.pixels[newIndex] = result.pixels[origIndex];
      }
    }
  }
  scaledResult.updatePixels();
  
  return scaledResult;
}

PImage img;

void setup(){
  size(768,256);  
  frameRate(10);
  img = loadImage("lena.png");
  img.resize(256,256);
}


void draw(){
   image(img, 0, 0);
   
   PImage img1 = sBlock(img, int(random(10,80)));
   image(img1, width/3, 0);
   
   PImage img2 = sBlock(img, int(random(10,80)), random(0.5, 1.5));
   image(img2, width/3 * 2, 0);
}

void keyPressed(){
   if(key == 'r' || key == 'R'){
      setup(); 
   }
}
