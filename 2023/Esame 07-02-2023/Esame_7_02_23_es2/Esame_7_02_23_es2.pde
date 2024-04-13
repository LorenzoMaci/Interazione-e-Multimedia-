PImage wow(PImage I){
  PImage ret = I.copy();
  int x = I.width;
  int y = I.height;
  
  ret.copy(I, 0,0, x/2, y, x/2, 0, x/2, y);
  ret.copy(I, x/2, 0, x/2, y, 0, 0, x/2, y);
  
  int random = int(random(0,100));
  int n = int(height * random)/100;
  
  for(int i = 0; i < width; i++){
     for(int j = 0; j<n; j++){
         int c = ret.get(i,j);
         float r = 255 - red(c);
         float g = green(c);
         float b = 255 - blue(c);
         ret.set(i,j, color(r,g,b));
     }
  }
  
  for(int i = 0; i < width; i++){
     for(int j = n; j<height; j++){
         int c = ret.get(i,j);
         float r = red(c);
         float g = 255 - green(c);
         float b = 255 - blue(c);
         ret.set(i,j, color(r,g,b));
    }
  }
  return ret;
}

PImage img;

void setup(){
   size(512,256);
   img = loadImage("lena.png");
   img.resize(256,256);
}

void draw(){
  image(img,0,0);
  
  PImage img1 = wow(img);
  image(img1, width/2,0);
}

void keyPressed(){
   if(key == 'r' || key == 'R'){
      setup(); 
   }
}
