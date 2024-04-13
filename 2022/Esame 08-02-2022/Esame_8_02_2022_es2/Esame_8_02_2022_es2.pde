PImage wow(PImage img){
   PImage ret = img.copy(); 
   
   int w = img.width;
   int h = img.height;
   
   ret.copy(img, 0, 0, w, h, 0, h/2, w, h); 
   ret.copy(img, 0, h/2, w, h, 0, 0, w, h/2);
   
   for(int i = w/2; i < w + w / 2; i++){
       ret.set(i, i, color(255));
   }
   return ret;
}

PImage mas(PImage img, int n){
   PImage r = img.copy();
   PImage temp; 
   int off = n/2;
   float[] tempf;
   
   tempf = new float[n*n];
   
   for(int i = 0; i< img.width; i++){
      for(int j = 0; j<img.height; j++){
         temp = img.get(i - off, j - off, n , n);
         
         temp.loadPixels();
         
         for(int z = 0; z < temp.pixels.length; z++){
            tempf[z] = green(temp.pixels[z]); 
         }
         
         r.set(i, j, color(max(tempf)));
      }
   }
   return r;
}

PImage img;

void setup(){
   size(768, 256);
   img = loadImage("lena.png");
   img.resize(256,256);
   img.filter(GRAY);
}  

void draw(){
   image(img, 0, 0);
   
   PImage img1 = wow(img);
   image(img1, width/3, 0);
   
   PImage img2 = mas(img1, int(random(5,15)));
   image(img2, width/3 * 2, 0);
}

void keyPressed(){
   if(key == 'r' || key == 'R'){
      setup(); 
   }
}
