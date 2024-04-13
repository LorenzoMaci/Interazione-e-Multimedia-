  color imMean(PImage imageRGB){
      color ret;
      imageRGB.loadPixels();
      
      float r = 0, g = 0, b = 0;
      
      for(int i = 0; i<imageRGB.pixels.length; i++){
         r += red(imageRGB.pixels[i]);
         g += green(imageRGB.pixels[i]);
         b += blue(imageRGB.pixels[i]);      
      }
      
      r /= imageRGB.pixels.length;
      g /= imageRGB.pixels.length;
      b /= imageRGB.pixels.length;
      
      ret = color(r,g,b);
      return ret;
  }
  
  color regionMean(PImage imgRGB, int x, int y, int n){
     PImage ret;
     
     if(x-n/2 < 0){
       x = n/2;
     }
     if(y - n/2 < 0){
        y = n/2; 
     }
     
     if(x + n/2 > imgRGB.width){
        x = imgRGB.width - n/2; 
     }
     if(y + n/2 > imgRGB.height){
        y = imgRGB.height - n/2; 
     }
     
     ret = imgRGB.get(x-n/2, y - n/2, n , n);
     return imMean(ret);
}
