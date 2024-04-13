int max = 217; //codice asci di 108 e 109  

PImage randomIm(int a, int c){
    PImage re = createImage(a, c, RGB);
    re.loadPixels();
    
    for(int i=0; i< re.pixels.length; i++){
        re.pixels[i]= color(int(random(0,max)), int(random(0,max)), int(random(0,max)));
    }
    re.updatePixels();
    return re;
}

PImage combine(PImage img1, PImage img2, float a){
   PImage re = img1.copy();
   img1.loadPixels();
   img2.loadPixels();
   re.loadPixels();
   
   for(int i=0; i<img1.pixels.length; i++){
       float r = ((a *red(img1.pixels[i]) + (1-a) * red(img2.pixels[i])));
       float g = ((a*green(img1.pixels[i]) + (1-a) * green(img2.pixels[i])));
       float b = ((a*blue(img1.pixels[i]) + (1-a) * blue(img2.pixels[i])));
       
       re.pixels[i] = color(r,g,b);   
   }
   re.updatePixels();
   return re;
}

PImage Im, ImR, ImC; //Immagine Random ImR, Immagine Combinata ImC
float alfa = 0.5;

void setup(){
  size(768,256);
  Im = loadImage("lena.png");
  Im.resize(256,256);
  ImR = randomIm(256,256);
}

void draw(){
  ImC = combine(Im,ImR, alfa);
  
  image(ImR,0,0);
  image(Im,ImR.width,0);
  image(ImC, ImR.width*2,0);
  
  textSize(30);
  text("Alfa = " + alfa, width/2-Im.width/2,height-40);
}

void keyPressed(){
  if(key=='+' && alfa <1){
    alfa+=0.1;
  }
  
  if(key=='-' && alfa>0.1){
    alfa-=0.1;
  }
}
