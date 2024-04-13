PImage img;

PImage wow(PImage I){
   PImage r = I.copy();
   
   PImage terzodx = I.get(2*I.width/3, 0, width/3, I.height);
   PImage terzosx = I.get(0,0, I.width/3, I.height);
   
   terzosx.loadPixels();
   terzodx.loadPixels();
   
   float f = random(0,2);
   float re, g, b;
   
   for(int i=0; i<terzosx.pixels.length; i++){
       re = red(terzosx.pixels[i]);
       b = blue(terzosx.pixels[i]);
       g = green(terzosx.pixels[i]);
       
       terzosx.pixels[i] = color(re/f, g, b);
   }
   
   
   for(int i=0; i<terzodx.pixels.length; i++){
      re = red(terzodx.pixels[i]);
       b = blue(terzodx.pixels[i]);
       g = green(terzodx.pixels[i]); 
       
       terzodx.pixels[i] = color(re*f, g, b);
   }
   
   terzosx.updatePixels();
   terzodx.updatePixels();
   
   r.set(0,0, terzodx);
   r.set(2*I.width/3, 0, terzosx);
   return r;
}

void setup(){
    size(512,512);
    
    img = loadImage("lena.png");
    
}


void draw(){
    PImage wow = wow(img);
    
    image(wow, 0,0);
}


void keyPressed(){
   if(key == 'r' || key == 'R'){
      setup(); 
   }
}
