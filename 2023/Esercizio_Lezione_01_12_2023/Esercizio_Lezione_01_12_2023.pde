PImage rev(PImage img){
   PImage ret = img.copy();
    
   int w = img.width;
   int h = img.height;
   
   ret.copy(img, 0, 0, w, h, w/2, 0, w, h);
   ret.copy(img, w/2, 0, w, h, 0, 0, w/2, h);
   
   for(int i = 0; i< img.pixels.length; i++){
      ret.set(i, i, color(255,255,0)); 
   }
   return ret;
}

PImage med(PImage img, int n){
  PImage ret = img.copy();
  PImage temp;
  int off = n/2;
  float[] tempf;
  float med;
  int xs;
  int ys;
  
  
  tempf = new float[n*n];
  
  for(int i = 0; i < img.width; i++){
     for(int j = 0; j < img.height; j++){
        xs = i - off;
        ys = j - off;
        temp = img.get(max(0,xs), max(0,ys), min(n, min(n + xs, img.width - xs)), min(n, min(n + ys, img.height - ys)));
        
        for(int z = 0 ; z < temp.pixels.length; z++){
           tempf[z] = green(temp.pixels[z]); 
        }
        
        tempf = sort(tempf); //riordina l'array
     
         if((temp.pixels.length)%2 == 1){
            med = tempf[(temp.pixels.length)/2]; 
         }else{
            med = (tempf[(temp.pixels.length)/2] + tempf[(temp.pixels.length)/2 - 1])/2;
         }
         ret.set(i, j , color(med));
     }
  }
  return ret;
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
   
   PImage img1 = rev(img);
   image(img1, width/3, 0);
   
   PImage img2 = med(img1, int(random(5,15)));
   image(img2, width/3 * 2, 0);
}

void keyPressed(){
   if(key == 'r' || key == 'R'){
      setup(); 
   }
}
