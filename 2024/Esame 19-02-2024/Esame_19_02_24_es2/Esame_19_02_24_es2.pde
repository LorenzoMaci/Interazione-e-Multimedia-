PImage imToGray(PImage imgRGB){
    PImage re = imgRGB.copy();
    imgRGB.loadPixels();
    re.loadPixels();
    
    for(int i=0; i<imgRGB.pixels.length; i++){
       int c = imgRGB.pixels[i];
       float r = red(c) * 0.5;
       float g = green(c) * 0.5;
       float b = blue(c) * 0.5;
       
       float colore = (r+g+b);
       re.pixels[i] = color(colore);
    }
    re.updatePixels();
    return re;
}

PImage estraiPianoN(PImage img, int n){
   PImage re = img.copy();
   re.loadPixels();
   
   for(int i=0; i<img.pixels.length; i++){
     int c = img.pixels[i];
     int bit = (c >> (n- 1)) & 1;
     re.pixels[i] = color(bit*255);
   }
   re.updatePixels();
   return re;
}

PImage img;
PImage gray;
PImage bitplane;

void setup(){
    size(768,256);
    
    img = loadImage("lena.png");
    
    img.resize(256,256);
    
    gray = imToGray(img);
    
    bitplane = estraiPianoN(gray, 8);
}

void draw(){
   image(img,0,0);
   
   image(gray, width/3 , 0);
   
    image(bitplane, width/3 *2, 0);
     
}

void keyPressed(){
  if(key >= '1' && key <= '7'){
      int n = key -'0';
      print("n= " + n);
      bitplane = estraiPianoN(gray, n);
  }
  if(key == 'r' || key == 'R'){
     setup(); 
  }
}
