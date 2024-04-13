PImage negativo(PImage I)
{
  PImage R=I.copy();
  
  //I.loadPixels();
  R.loadPixels();
  
  float r,g,b;
  for(int i=0; i<R.pixels.length; i++)
  {
    r=255-red(R.pixels[i]);
    g=255-green(R.pixels[i]);
    b=255-blue(R.pixels[i]);
    
    R.pixels[i]=color(r,g,b);
  }
  
  R.updatePixels();
  
  return R;
}

PImage gamma(PImage I, float gm)
{
  PImage R=createImage(I.width,I.height,RGB);
  
  R.loadPixels();
  I.loadPixels();
  
  float r,g,b;
  float C=1/pow(255,gm-1);
  
  for(int i=0; i<R.pixels.length; i++)
  {
    r=C*pow(red(I.pixels[i]),gm);
    g=C*pow(green(I.pixels[i]),gm);
    b=C*pow(blue(I.pixels[i]),gm);
    
    R.pixels[i]=color(r,g,b);
  }
  R.updatePixels();
  return R;
}

PImage logaritmo(PImage I)
{
  PImage R=createImage(I.width,I.height,RGB);
  
  R.loadPixels();
  I.loadPixels();
  
  float r,g,b;
  float C=255/log(256);
  
  for(int i=0; i<R.pixels.length; i++)
  {
    r=C*log(1+red(I.pixels[i]));
    g=C*log(1+green(I.pixels[i]));
    b=C*log(1+blue(I.pixels[i]));
    
    R.pixels[i]=color(r,g,b);
  }
  R.updatePixels();
  return R;
}

PImage quantizza(PImage I, int k)
{
  PImage R=I.copy();
  
  R.loadPixels();
  
  int q;
  for(int i=0;i<R.pixels.length;i++)
  {
    q=floor((blue(R.pixels[i])*k)/256);
    q= int((float(q)/(k-1))*255);
    //q=int(lerp(0,255,float(q)/(k-1)));
    
    R.pixels[i]=color(q);
  }
  R.updatePixels();
  return R;
  
}

PImage massimo(PImage I, int N)
{
  PImage R=createImage(I.width, I.height, RGB);
  PImage tmp; //immagine per  rappresentare la finestra nxn
  int off=N/2; //garantisce che l'intorno sia centrato
  float[] tmpF; //array per memorizzare i valori
  
  tmpF=new float[N*N];
  
  for(int x=0; x<I.width; x++)
  {
     for(int y=0;y<I.height; y++)
     {
       
       tmp=I.get(x-off,y-off,N,N); //creazione dell'immagine della finestra nxn
       
       tmp.loadPixels();
       
       for(int i=0; i<tmp.pixels.length;i++) //scorriamo i pixels dell'immagine della finestra
       {
         tmpF[i]=green(tmp.pixels[i]); // memorizziamo nell'array i valori di verde
       }
       
       R.set(x,y,color(max(tmpF))); //dopo averli memorizzati li impostiamo nell'immagine che ci restituira il massimo
     } //con la funzione set e assegnando il colore massimo dell'array dell'intorno
  }
  
  return R;
  
}


PImage minimo(PImage I, int N)
{
  PImage R=createImage(I.width, I.height, RGB);
  PImage tmp;
  int off=N/2;
  float[] tmpF;
  int xs;
  int ys;
  
  for(int x=0; x<I.width; x++)
  {
     for(int y=0;y<I.height; y++)
     {
       xs=x-off;
       ys=y-off;
       
       tmp=I.get(max(0,xs),max(0,ys),min(N,min(N+xs,I.width-xs)),min(N,min(N+ys,I.height-ys)));
       
       tmp.loadPixels();
       
       tmpF=new float[tmp.pixels.length];

       for(int i=0; i<tmp.pixels.length;i++)
       {
         tmpF[i]=green(tmp.pixels[i]);
       }
       
       R.set(x,y,color(min(tmpF)));
     }
  }
  
  return R;
  
}

PImage mediano(PImage I, int N){
  PImage R=createImage(I.width, I.height, RGB);
  PImage tmp;
  int off=N/2;
  float[] tmpF;
  float med;
  int xs;
  int ys;
  
  
  for(int x=0; x<I.width; x++){
     for(int y=0;y<I.height; y++){
       xs=x-off;
       ys=y-off;
       
      tmp=I.get(max(0,xs),max(0,ys),min(N,min(N+xs,I.width-xs)),min(N,min(N+ys,I.height-ys)));
       
       tmp.loadPixels();
       tmpF=new float[tmp.pixels.length];
       for(int i=0; i<tmp.pixels.length;i++)
       {
         tmpF[i]=green(tmp.pixels[i]);
       }
     
       tmpF=sort(tmpF);
       
       if((tmp.pixels.length)%2==1)
         med=tmpF[(tmp.pixels.length)/2];
       else
       {
         med=(tmpF[(tmp.pixels.length)/2]+tmpF[(tmp.pixels.length)/2-1])/2;
       }
       
       R.set(x,y,color(med));
     }
  }
  
  return R;
  
}

PImage bitplane(PImage I, int nb){
  PImage R=I.copy();
  
  R.loadPixels();
  
  int x;
  int r;
  for(int i=0; i<R.pixels.length;i++)
  {
    x=int(blue(R.pixels[i]));
    
    r=(x>>nb)&1;
    
    R.pixels[i]=color(255*r); 
  }
  
  R.updatePixels();
  return R;
}

PImage scaleF(PImage I, float sx, float sy)
{
  PImage R=createImage(I.width, I.height, RGB);
  
  R.loadPixels();
  for(int i=0; i<R.pixels.length;i++){
    R.pixels[i]=color(0);
  }
  
  float x,y;
  float u1,v1;
  for(int u=0; u<I.width;u++)
  {
    for(int v=0; v<I.height;v++)
    {
      
      u1=u-I.width/2;
      v1=v-I.height/2;
      
      x=u1*sx;
      y=v1*sy;
      
      x=x+I.width/2;
      y=y+I.height/2;
      
      R.set(round(x),round(y),I.get(u,v));
      
    }
  }
  
  return R;
}



//Scaling con inverse mapping
PImage scaleI(PImage I, float sx, float sy)
{
  PImage R=createImage(I.width, I.height, RGB);
  
  R.loadPixels();
  for(int i=0; i<R.pixels.length;i++)
  {
    R.pixels[i]=color(0);
  }
  
  float u,v;
  float x1,y1;
  
  for(int x=0; x<I.width;x++)
  {
    for(int y=0; y<I.height;y++)
    {
      
      x1=x-I.width/2;
      y1=y-I.height/2;
      
      u=x1*1/sx; //nel caso di rotazione u =x1*cos(theta)+y1*sin(theta);
      v=y1*1/sy; //nel caso di rotazione v =x1*sin(theta)+y1*cos(theta);
      
      u=u+I.width/2;
      v=v+I.height/2;
      
      R.set(x,y,I.get(round(u),round(v)));
      
    }
  }
  
  return R;
}

PImage stretching(PImage I){
  PImage R=I.copy();
  float max, min;
  R.loadPixels();
  max=red(R.pixels[0]);
  min=red(R.pixels[0]);
  
  for (int i=0;i<R.pixels.length;i++){
    if (red(R.pixels[i])<min){
      min=red(R.pixels[i]);
    }
    if (red(R.pixels[i])>max){
      max=red(R.pixels[i]);
    }
  }
  
  for (int i=0;i<R.pixels.length;i++){
    R.pixels[i]=color(255*(red(R.pixels[i])-min)/(max-min));
  }
  R.updatePixels();
  return R;
  
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

PImage replication2x(PImage I){
  PImage R=createImage(2*I.width,2*I.height,RGB);
  
  for(int x=0; x<I.width; x++)
  {
    for(int y=0; y<I.height;y++)
    {
      
      R.set(2*x,2*y,I.get(x,y));
      
      R.set(2*x+1,2*y,I.get(x,y));
      R.set(2*x,2*y+1,I.get(x,y));
      R.set(2*x+1,2*y+1,I.get(x,y));
      
    }
  }
  
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
