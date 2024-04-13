PImage imgRGB;

PImage channel(PImage imgRGB, char c){
    PImage convertImg = createImage(imgRGB.width, imgRGB.height, RGB);
    imgRGB.loadPixels();
    convertImg.loadPixels();
    
    for(int i =0; i< imgRGB.pixels.length; i++){
       float colore;
       if(c == 'r'){
          colore = red(imgRGB.pixels[i]);
          convertImg.pixels[i] = color(colore);
       }
       if(c == 'g'){
          colore = green(imgRGB.pixels[i]);
          convertImg.pixels[i] = color(colore);
       }
       if(c == 'b'){
          colore = blue(imgRGB.pixels[i]);
          convertImg.pixels[i] = color(colore);
       }
    }
    convertImg.updatePixels();
    return convertImg;
}

PImage changeColor(PImage imgRGB, char c, int v){
    PImage change = createImage(imgRGB.width, imgRGB.height, RGB);
    imgRGB.loadPixels();
    change.loadPixels();
    for(int i=0; i<imgRGB.pixels.length; i++){
      float r = red(imgRGB.pixels[i]);
      float g = green(imgRGB.pixels[i]);
      float b = blue(imgRGB.pixels[i]);
       if(c == 'r'){
           r += v;
       }
       else if( c == 'g'){
          g += v; 
       }
       else if( c == 'b'){
          b += v; 
       }
       r = constrain(r, 0, 255);
       g = constrain(g, 0, 255);
       b = constrain(b, 0, 255);
       change.pixels[i] = color(r,g,b);
    }
    change.updatePixels();
    return change;    
}
