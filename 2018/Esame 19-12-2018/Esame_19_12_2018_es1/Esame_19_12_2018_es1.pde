PImage gamma(PImage img, float gm){
   PImage re = img.copy();
   img.loadPixels();
   re.loadPixels();
   
   for(int i=0; i<img.pixels.length; i++){
      int c = img.pixels[i];
      float r = pow(red(c)/255.0, gm) * 255;
      float g = pow(green(c)/255.0, gm) * 255;
      float b = pow(blue(c)/255.0, gm) * 255;
      
      re.pixels[i] = color(r,g,b);
   }
   re.updatePixels();
   return re;
}

PImage logaritmico(PImage img){
   PImage re = img.copy();
   img.loadPixels();
   re.loadPixels();
   
   for(int i=0; i<img.pixels.length; i++){
      int c = img.pixels[i];
      float r = log(1+red(c)) * 40;
      float g = log(1+green(c)) * 40;
      float b = log(1 + blue(c)) * 40;
      re.pixels[i] = color(r,g,b);
   }
   re.updatePixels();
   return re;
}

PImage applyOperator(PImage img, int x, int y, int n, int s){
      PImage r = img.copy();
      PImage temp = r.get(x-n/2, y - n/2, n, n);
      
      if(s == 1){
         temp = logaritmico(temp); 
      }
      else if(s == 2){
         temp = gamma(temp, 2); 
      }
      r.set(x-n/2, y - n/2, temp);
      return r;
}

PImage img;
int k = 75;
int mode = 1;

void setup(){
  size(512,512);
  
  img = loadImage("lena.png");
  
}


void draw(){
    image(img, 0, 0);
    
    noFill();
    stroke(0);
    rectMode(CENTER);
    rect(mouseX, mouseY, k, k);
    
}

void mousePressed(){
   img = applyOperator(img, mouseX, mouseY, k, mode); 
}

void keyPressed(){
   if(key == '+' && k <= 511){
       k += 2; 
   }
   else if( key == '-' && k >= 3){
     k -= 2;
   }
   
   if(key == '1'){
      mode = 1; 
   }else if( key == '2'){
      mode = 2; 
   }
   if(key == 'r' || key == 'R'){
      setup(); 
   }
}
