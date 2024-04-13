PImage lemonFilter(PImage img){
   PImage re = img.copy();
   img.loadPixels();
   re.loadPixels();
   
   float r, g, b;
   
   for(int i = 0; i < img.pixels.length; i++){
       r = red(img.pixels[i]);
       g = green(img.pixels[i]);
       b = blue(img.pixels[i]);
       
       
       re.pixels[i] = color(r-(b/g), g + b, 0);
   }
   re.updatePixels();
   return re;
}


PImage orangeFilter(PImage img){
     PImage re = img.copy();
     img.loadPixels();
     re.loadPixels();
   
     float r, g, b;
   
     for(int i = 0; i < img.pixels.length; i++){
       r = red(img.pixels[i]);
       g = green(img.pixels[i]);
       b = blue(img.pixels[i]);
       
       re.pixels[i] = color(r + b, g, 0);
   }
   re.updatePixels();
   return re;
}

PImage applyArea(PImage img, int x, int y, int d, boolean f){
    PImage r = img.copy();
    PImage temp = r.get(x-d/2, y - d/2, d, d); //così ottengo il quadrato 
    
    if(f){
       temp = orangeFilter(temp); 
    }else{
       temp = lemonFilter(temp); 
    }
    r.set(x-d/2, y-d/2,temp);
    return r;
}

PImage img;
int N = 101;

void setup(){
   size(512,512);
   
   img = loadImage("lena.png");
   img.resize(512,512);
   
}

void draw(){
   
   image(img,0,0);
   
   noFill();
   stroke(0);
   rectMode(CENTER);
   rect(mouseX, mouseY, N, N); 
}

void mousePressed(){
   if(mouseButton == RIGHT){
      img = applyArea(img, mouseX, mouseY, N, false); 
   }else if(mouseButton == LEFT){
      img = applyArea(img, mouseX, mouseY, N, true); 
   }
}

void keyPressed(){
   if(key == '+' && N <= 151){
         N += 2;
   }else if(key == '-' && N >= 51){
      N -= 2; 
   }
   if(key == 'r' || key == 'R'){
      setup(); 
   }
}
