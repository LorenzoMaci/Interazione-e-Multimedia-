PImage fusion(PImage img1, PImage img2, float k){
    PImage re = img1.copy();
    img1.loadPixels();
    img2.loadPixels();
    re.loadPixels();
    
    for(int i = 0; i< img1.pixels.length; i++){
        int c1 = img1.pixels[i];
        int c2 = img2.pixels[i];
        int r = (int) (red(c1) * k + red(c2) * (1-k));
        int g  = (int) (green(c1) * k + green(c2) * (1-k));
        int b = (int) (blue(c1) * k + blue(c2) * (1-k)); 
        
        re.pixels[i] = color(r,g,b);
    }
    re.updatePixels();
    return re;
}

PImage subtract(PImage img1, PImage img2, float k){
   PImage re = img1.copy();
   img1.loadPixels();
   img2.loadPixels();
   re.loadPixels();
   
   for(int i = 0; i<img1.pixels.length; i++){
      int c1 = img1.pixels[i];
      int c2 = img2.pixels[i];
      int r = (int) (red(c1) - k*red(c2));
      int g = (int) (green(c1) - k * green(c2));
      int b  = (int) (blue(c1) - k * blue(c2));
      
      re.pixels[i] = color(r,g,b);
   }
   re.updatePixels();
   return re;
}

PImage img1;
PImage img2;
float k = 0.5;

void setup(){
   size(512,512);
   img1 = loadImage("lena.png");
   img2 = loadImage("baboon.jpg");
   
   img1.resize(256,256);
   img2.resize(256,256);
}

void draw(){
    image(img1, 0, 0);
    image(img2, 0, height/2);
    
    PImage f = fusion(img1,img2,k);
    image(f, width/2, 0);
    
    PImage sub = subtract(img1, img2, k);
    image(sub, width/2, height/2);
    
}

void keyPressed(){
   if(key == '+'){
      k = constrain(k + 0.05, 0, 1);
   }
   else if(key == '-'){
      k = constrain(k - 0.05, 0, 1);
   }
   
}
