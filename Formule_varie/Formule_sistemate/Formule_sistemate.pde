PImage negativo(PImage I){
   PImage ret = I.copy();
   
   ret.loadPixels();
   
   for(int i = 0;  i< I.pixels.length; i++){
      float r = 255 - red(I.pixels[i]);
      float g = 255 - green(I.pixels[i]);
      float b = 255 - blue(I.pixels[i]);    
      ret.pixels[i] = color(r,g,b);
   }
   ret.updatePixels();
   return ret;
}

PImage gamma(PImage I, float gm){
   PImage ret  = I.copy();
   ret.loadPixels();
   float c = 1/pow(255,gm - 1);
   
   for(int i = 0; i < I.pixels.length; i++){
      float r = c*pow(red(I.pixels[i]),gm);
      float g = c*pow(green(I.pixels[i]),gm); 
      float b = c*pow(blue(I.pixels[i]),gm); 
      
      ret.pixels[i] = color(r,g,b);
   }
   ret.updatePixels();
   return ret;
}

PImage logaritmo(PImage I){
    PImage ret = I.copy();
    ret.loadPixels();
    float c = 255/log(256);
    
    for(int i = 0; i<I.pixels.length; i++){
       float r = c*log(1 + red(I.pixels[i]));
       float g = c*log(1 + green(I.pixels[i]));
       float b = c*log(1 + blue(I.pixels[i]));
       
       ret.pixels[i] = color(r,g,b);
    }
    ret.updatePixels();
    return ret;
}

PImage quantizza(PImage I, int k){
   PImage ret = I.copy();
   ret.loadPixels();
   
   int q;
   for(int i = 0; i<I.pixels.length; i++){
     q = floor((blue(I.pixels[i])*k)/256);
     q = int((float(q)/(k-1))*255);
     ret.pixels[i] = color(q);
   }
   ret.updatePixels();
   return ret;
}

PImage massimo(PImage I, int n){
  PImage ret = I.copy();
  PImage temp;
  int off = n/2;
  float[] tempf = new float[n*n];
  
  for(int i = 0; i<I.width; i++){
    for(int j = 0; j<I.height; j++){
       temp = I.get(i - off, j - off, n, n);
       temp.loadPixels();
       for(int z = 0; z < temp.pixels.length; z++){
          tempf[z] = green(temp.pixels[z]); 
       }
       temp.updatePixels();
       ret.set(i,j, color(max(tempf)));
    }
  }
  return ret;
}

PImage minimo(PImage I, int n){
   PImage ret = I.copy();
   PImage temp;
   int off = n/2;
   float[]tempf;
   int xs;
   int ys;
   
   for(int i = 0; i<I.width; i++){
      for(int j = 0; j<I.height; j++){
        xs = i - off;
        ys = j - off;
         temp = I.get(max(0,xs), max(0,ys), min(n, min(n+xs,I.width-xs)), min(n,min(n+ys,I.height-ys)));
         temp.loadPixels();
         tempf = new float[temp.pixels.length];
         for(int z = 0; z < temp.pixels.length; z++){
            tempf[z] =  green(temp.pixels[z]);
         }
         temp.updatePixels();
         ret.set(i, j, color(min(tempf)));
      }
   }
   return ret;
}

PImage mediano(PImage I, int n){
   PImage ret = I.copy();
   PImage temp;
   int off = n/2;
   float[]tempf;
   int xs;
   int ys;
   float med;
   
   for(int i = 0; i<I.width; i++){
      for(int j=0; j<I.height; j++){
         xs = i - off;
         ys = j - off;
         temp = I.get(max(0,xs), max(0,ys), min(n,min(n+xs,I.width-xs)),min(n,min(n+ys,I.height-ys)));
         tempf = new float[temp.pixels.length];
         temp.loadPixels();
         for(int z = 0; z<temp.pixels.length; z++){
            tempf[z] = green(temp.pixels[z]); 
         }
         temp.updatePixels();
         if((temp.pixels.length)%2 == 1){
             med = tempf[(temp.pixels.length)/2];
         }else{
            med =(tempf[(temp.pixels.length)/2]+tempf[(temp.pixels.length)/2 - 1])/2;
         }
         ret.set(i, j, color(med));
    }
   }
   return ret;
}

PImage bitplane(PImage I, int n){
   PImage ret = I.copy();
   ret.loadPixels();
   for(int i =0; i<I.pixels.length; i++){
      int c = I.pixels[i];
      int bitplane = (c >> (n -1))&1;
      ret.pixels[i] = color(bitplane * 255);
   }
   ret.updatePixels();
   return ret;
}

PImage scaleF(PImage I, float sx, float sy){
   PImage ret = I.copy();
   ret.loadPixels();
   for(int i=0; i<ret.pixels.length; i++){
      ret.pixels[i] = color(0); 
   }
   float x,y;
   float u1,v1;
   for(int i = 0; i<I.width; i++){
      for(int j =0; j<I.height; j++){
         u1 = i - I.width/2;
         v1 = j - I.height/2;
         
         x = u1 *sx;
         y = v1*sy;
         
         x += I.width/2;
         y += I.height/2;
         ret.set(round(x),round(y),I.get(i,j));
      }
   }
   ret.updatePixels();
   return ret;
}

PImage scaleI(PImage I, float sx, float sy){
   PImage ret = I.copy();
   ret.loadPixels();
   for(int i =0; i<ret.pixels.length; i++){
      ret.pixels[i] = color(0); 
   }   
   float x,y;
   float u1,u2;
   for(int i = 0; i<I.width; i++){
      for(int j=0; j<I.height; j++){
         u1 = i - I.width/2;
         u2 = j - I.height/2;
         
         x = u1 * 1/sx;
         y = u2 * 1/sy;
         
         x += I.width/2;
         y += I.height/2;
         ret.set(i, j, I.get(round(x),round(y)));
      }
   }
   ret.updatePixels();
   return ret;
}

PImage stretching(PImage I){
   PImage ret = I.copy();
   float max, min;
   ret.loadPixels();
   max = red(ret.pixels[0]);
   min = red(ret.pixels[0]);
   
   for(int i = 0; i<ret.pixels.length; i++){
      if(red(ret.pixels[i]) < min){
         min = red(ret.pixels[i]); 
      }
      if(red(ret.pixels[i]) > max){
         max = red(ret.pixels[i]); 
      }
   }   
   for(int i = 0; i<ret.pixels.length; i++){
      ret.pixels[i] = color(255*(red(ret.pixels[i])-min)/(max-min)); 
   }
   ret.updatePixels();
   return ret;
}

PImage replication2x(PImage I){
   PImage ret = I.copy();
   
   for(int i = 0; i<I.width; i++){
      for(int j = 0; j<I.height; j++){
         ret.set(2*i,2*j,I.get(i,j));
         ret.set(2*i+1,2*j, I.get(i,j));
         ret.set(2*i,2*j+1, I.get(i,j));
         ret.set(2*i+1,2*j+1,I.get(i,j));
      }
   }
   return ret;
}

float [] istogramma(PImage I){
  float[] H= new float[256];
  for (int i=0; i<256;i++){
    H[i]=0;
  }
  I.loadPixels();
  for (int i=0;i<I.pixels.length;i++){
    H[int(red(I.pixels[i]))]++;
  }
  for (int i=0; i<256;i++){
    H[i]=H[i]/I.pixels.length;
  }
  return H;
}

PImage equalizza(PImage I){
  PImage R=I.copy();
  float [] H =istogramma(I);
  //Istogramma cumulativo
  for (int i=1;i<256;i++){
    H[i]=H[i-1]+H[i];
  }
  R.loadPixels();
  for (int i=0;i<R.pixels.length;i++){
    R.pixels[i]=color(255*H[int(red(R.pixels[i]))]);
  }
  R.updatePixels();
  return R;
}

float MSE(PImage I1, PImage I2){
  float res=0;  
  I1.loadPixels();
  I2.loadPixels();
  for(int i=0; i<I1.pixels.length;i++){
    res+=pow(blue(I1.pixels[i])-blue(I2.pixels[i]),2);
  }
  
  res=res/I1.pixels.length;
  
  return res;
}

float PSNR(PImage I1, PImage I2){
  float res=0;
  float mse=MSE(I1,I2);

  res=10*log(255*255/mse)/log(10);
  return res;
}
