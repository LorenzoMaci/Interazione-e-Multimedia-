PImage LenaRGB;
int n = 1;
int frame = int('m') - 60;
int k = 20 + 1;

void setup(){
   size(1024,512);
   LenaRGB = loadImage("lena.png");
   LenaRGB.resize(512,512);
   frameRate(frame);
   
   
}

void draw(){
   image(LenaRGB,0,0);
   
   PImage convert = grid(LenaRGB, 2*n);
   
   image(convert, 512, 0);
   
   if(frameCount % k == 0){
      n = (n % 8) + 1; 
   }
}
