PImage logOp(PImage img){
   PImage R = img.copy();
   img.loadPixels();
   R.loadPixels();
   
   for(int i=0; i<img.pixels.length; i++){
      int c = img.pixels[i];
      float r = (int)(log(1 + red(c))*255/ log(256));
      float g = (int)(log(1 + green(c))*255 / log(256));
      float b = (int)(log(1 + blue(c))*255/log(256));
       
      R.pixels[i] = color(r,g,b);
   }
   R.updatePixels();
   
   return R;
}

PImage logOp(PImage img, int h, int k){
   int w = img.width;
   int ht = img.height;
   
   PImage R = createImage(w, ht, ALPHA);
   
   img.loadPixels();
   R.loadPixels();
   
   int centroX = int(random(h/2, w-h/2));
   int centroY = int(random(k/2, ht-k/2));
   
   for(int y = centroY - k/2;  y < centroY + k/2; y++){
      for(int x = centroX -h/2; x < centroX + h/2; x++){
          int index = x + y *w;
          R.pixels[index] = color(0);
      }
   }
   
    for (int y = 0; y < height; y++) {
    for (int x = 0; x < w; x++) {
      if ((x >= centroX - h / 2 && x < centroY + h / 2) &&
          (y >= centroY - k / 2 && y < centroY + k / 2)) {
        // pixel all'interno del rettangolo nero
        continue;
      }
      
      int index = x + y * w;
      int c = img.pixels[index];
      int r = (int) (log(1 + red(c)) * 255 / log(256));
      int g = (int) (log(1 + green(c)) * 255 / log(256));
      int b = (int) (log(1 + blue(c)) * 255 / log(256));
      R.pixels[index] = color(r, g, b);
    }
  }
  
  R.updatePixels();
  
  return R;
}

PImage img;

void setup(){
  size(768,256);
  
  img = loadImage("lena.png");
  img.filter(GRAY);
  img.resize(256,256);
  
}


void draw(){
   image(img, 0, 0);
   
   PImage c = logOp(img);
   image(c, width/3, 0);
   
   PImage d = logOp(img, int(random(10,70)), int(random(10,70)));
   
   image(d, width/3*2, 0);
}
