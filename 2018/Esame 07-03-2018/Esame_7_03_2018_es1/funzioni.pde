PImage stretching(PImage imgRGB){
    PImage ret = createImage(imgRGB.width, imgRGB.height, RGB);
    imgRGB.loadPixels();
    ret.loadPixels();
    
    //MINIMO E MASSIMO DEI COLORI PER I BIN
    float RMin = 255, GMin = 255, BMin = 255;
    float RMax = 0, GMax = 0, BMax = 0; 
    
    for(int i = 0; i< imgRGB.pixels.length; i++){
       color c = imgRGB.pixels[i];
       float r = red(c);
       float g = green(c);
       float b = blue(c);
       
       RMin = min(RMin, r);
       GMin = min(GMin, g);
       BMin = min(BMin, b);
       
       RMax = max(RMax, r);
       GMax = max(GMax, g);
       BMax = max(BMax, b);
    }
    
    for(int i=0; i<imgRGB.pixels.length; i++){
        color c = imgRGB.pixels[i];
        float r = map(red(c), RMin, RMax, 0, 255);
        float g = map(green(c), GMin, GMax, 0, 255);
        float b = map(blue(c), BMin, BMax, 0, 255);
        
        ret.pixels[i] = color(r,g,b);
    }
    ret.updatePixels();
    return ret;
}

PImage grid(PImage imgRGB, int n){
   PImage r = createImage(imgRGB.width, imgRGB.height, RGB);
   
   int subWidth = imgRGB.width/n;
   int subHeight = imgRGB.height /n;
   
   for(int i=0; i<n; i++){
     for(int j=0; j<n; j++){
        PImage sub = imgRGB.get(j*subWidth, i * subHeight, subWidth ,subHeight);
        PImage stretc = stretching(sub);
        r.copy(stretc, 0, 0, stretc.width, stretc.height,  j * subWidth, i * subHeight, subWidth, subHeight);
     } 
   }
   return r;
}
