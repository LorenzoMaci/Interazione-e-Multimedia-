PImage imToGray(PImage img){
    PImage ret = img.copy();
     ret.loadPixels();
     
     for(int i = 0; i< img.pixels.length; i++){
        int c = img.pixels[i];
        float r = 0.5 * red(c);
        float g = 0.5 * green(c);
        float b = 0.5 * blue(c);
        ret.pixels[i] = color(r + g + b);
     }
     ret.updatePixels();
     return ret;
}

PImage estraiPianoN(PImage img, int n){
   PImage ret = img.copy();
   ret.loadPixels();
   
   for(int i = 0; i < img.pixels.length; i++){
      int c = img.pixels[i];
      int bitplane = (c >> (n - 1)) & 1;
      ret.pixels[i] = color(bitplane * 255);
   }
   ret.updatePixels();
   return ret;
}

PImage img;
PImage img1;
PImage img2;

void setup(){
   size(768, 256);
   img = loadImage("lena.png");
   img.resize(256,256);
   img1 = imToGray(img);
   img2 = estraiPianoN(img1, 8);
}  

void draw(){
   image(img, 0, 0);
   
   image(img1, width/3, 0);
  
   image(img2, width/3 * 2, 0);

}

void keyPressed(){
   if(key >= '1' && key <= '8'){
      int n = key - '0';
      print(n);
      img2 = estraiPianoN(img1, n);      
   }
}
