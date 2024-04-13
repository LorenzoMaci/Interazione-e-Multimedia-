PImage jonnyFilter(PImage img, int n){
    PImage jn = img.copy();
    PImage window; 
    
    for(int i = n/2; i < jn.width - n/2; i++){ // cicli che mi scorrono l'immagine
       for (int j = n/2; j < jn.height - n/2; j++){ // nella posizione x e y
          window  = jn.get(i - n/2, j - n/2, n,n);
          window.loadPixels();
          float max = red(window.pixels[0]);
          float min = red(window.pixels[0]);
          
          for(int x = 1; x<window.pixels.length; x++){ //scorre tutti gli elementi e mi trova il min e il max
              if(red(window.pixels[x]) > max)
                max = red(window.pixels[x]);
              
              if(red(window.pixels[x]) < min)
                 min = red(window.pixels[x]);
          }
          float dif = max - min;
          
          jn.set(i - n/2, j - n/2, color(dif));
          jn.updatePixels();
       }
    }
    return jn;
}
