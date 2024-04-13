PImage wow(PImage img){
   PImage r = img.copy();

   int w = img.width;
   int h = img.height;
   
    r.set(0, 0, img.get(w - w/ 3, 0, w, h)); // lato sinistro
    r.set(w / 3, 0, img.get(w / 3, 0, w - w / 3, h)); // centro immagine
    r.set(w - w / 3, 0, img.get(0, 0, w - w/ 3, h)); // lato destro

   int f = int(random(0,2));
   
   for(int i = 0; i<w/3; i++){
      for(int j =0; j< h ; j++){
            int c = r.pixels[i + j * w];
            r.set(i, j, color(red(c)/f, green(c), blue(c)));
      }
   }
   
   for(int i = w - w/3; i< w; i++){
      for(int j=0; j<h; j++){
         int c = r.pixels[i + j * w];
         r.set(i, j, color(red(c)*f, green(c), blue(c)));
      }
   }
 
   return r;
}

PImage img;

void setup(){
  size(512,512);
  
  img = loadImage("lena.png");
  img.resize(512,512);
  
}

void draw(){
   PImage wow = wow(img);
   
   image(wow, 0, 0);
}

void keyPressed(){
   if(key == 'r' || key == 'R'){
      setup(); 
   }
}
