PImage sqr(PImage I){
   PImage ret = I.copy();
   
    for(int i = 0; i<I.width/2; i++){
      for(int j = I.height/2; j < I.height; j++){
         ret.set(i, j, color(255,255,0)); 
      }
    }
   
   return ret;
}

PImage colo(PImage I, int n){
   PImage ret = I.copy();
   
   for(int i = 0; i<I.width; i++){
      for(int j = i ; j<I.height; j++){
          int c = I.get(i,j);
          float r = red(c);
          float b = n;
          float g = green(c);
          
          ret.set(i, j, color(r,g,b));
      }
   }
   
   for(int i = 0; i<I.width; i++){
      for(int j = 0; j<i + 1; j++){
         int c = I.get(i,j);
         float r = n;
         float g = green(c);
         float b = blue(c);
         
         ret.set(i,j, color(r,g,b));
      }
   }
   
   return ret;
}


PImage img;

void setup(){
   size(768,256);
   img = loadImage("lena.png");
   img.resize(256,256);
}

void draw(){
   image(img,0,0);
   
   PImage sq = sqr(img);
   image(sq, width/3, 0);
   
   PImage col = colo(sq, 255);
   image(col, width/3 * 2, 0);
}
