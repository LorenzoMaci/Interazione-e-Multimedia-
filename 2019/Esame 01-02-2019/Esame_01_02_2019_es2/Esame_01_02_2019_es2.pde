PImage hash(PImage img, int h, int k){
   PImage ret = img.copy();
   ret.loadPixels();
   
   for(int j = 0; j< img.height; j++){
      for(int i = 0; i<img.width; i++){
        int index = i + j * img.width;
         if( j == h || j == k || i == h || i == k){
            ret.pixels[index] = color(0);
         }else{
           ret.pixels[index] = img.pixels[index];
         }
      }
   }
   ret.updatePixels();
   return ret;
}

PImage hash(PImage img, int h, int k, int n){
   PImage ret = img.copy();
   PImage temp;
   int off = n/2;
   float[] tempf;
   
   tempf = new float[n*n];
   
   for(int i = 0; i<img.width; i++){
      for(int j=0; j<img.height; j++){
         temp = img.get(i - off, j - off, n, n);
         
         temp.loadPixels();
         for(int z=0; z<temp.pixels.length; z++){
            tempf[z] = green(temp.pixels[z]);
          }
          ret.set(i,j,color(max(tempf)));
      }
   }
    
   
   for(int j = 0; j< img.height; j++){
     for(int i = 0;i <img.width; i++){
        int index = i + j * img.width; 
        if ( j == h || j == k || i == h || i == k){
           ret.pixels[index] = color(0); 
        }else{
           ret.pixels[index] = img.pixels[index]; 
        }
     }
   }
   return ret;
}

PImage img;

void setup(){
   size(768,256);
   img = loadImage("lena.png");
   img.resize(256,256);
   img.filter(GRAY);
}

void draw(){
   image(img, 0, 0);
   
   PImage ha = hash(img, int(random(1,256)),int(random(1,256)));
   image(ha, width/3, 0);
   
   PImage max = hash(img,int(random(1,256)),int(random(1,256)), int(random(3,11)));
   image(max, width/3*2, 0);
}

void keyPressed(){
   if(key == 'r' || key == 'R'){
      setup(); 
   }
}
