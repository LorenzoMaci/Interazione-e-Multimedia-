PImage imgGray;
PImage uniQ;
PImage logQ;
int N = 10;
void setup(){
    size(768,280);
    imgGray = loadImage("Lena.jpeg");
    imgGray.resize(256, 256);
    
}

void draw(){
  background(0);
  image(imgGray, 0, 0);
  text("Originale", 80, 270);
  
  uniQ = uniQuant(imgGray, N);
  image(uniQ, width/3, 0);
  text("Quantizzazione uniforme", 336, 270);
  
  logQ = logQuant(imgGray, N);
  image(logQ, width*2 / 3, 0);
  text("Logaritmica", 688, 270);
  
  text("N: " + N, 10, 270);  
}

void keyPressed(){ 
  if(key == '+'){
      N = constrain(N +1, 2, 256);
       uniQ = uniQuant(imgGray, N);
       logQ = logQuant(imgGray, N);
   }
   else if(key == '-'){
     N = constrain(N - 1, 2, 256); 
       uniQ = uniQuant(imgGray, N);
       logQ = logQuant(imgGray, N);
   }
}

PImage uniQuant(PImage imgGray, int k){
    PImage R = imgGray.copy();
    R.loadPixels();
    
    int q;
    for(int i=0; i<R.pixels.length; i++){
       q = floor((blue(R.pixels[i])*k)/256);
       q = int((float(q)/(k-1))*255);
       
       R.pixels[i] = color(q);
    }
    R.updatePixels();
    
    return R;
}

PImage logQuant(PImage imgGray, int k) {
  PImage R = imgGray.copy();
  R.loadPixels();

  for (int i = 0; i < R.pixels.length; i++) {
    float grayValue = blue(R.pixels[i]);
    int quantizedValue = round(pow(2, log(k) * (grayValue / 255.0))) - 1;
    quantizedValue = round(map(quantizedValue, 0, k - 1, 0, 255));
    R.pixels[i] = color(quantizedValue);
  }

  R.updatePixels();
  return R;
}
