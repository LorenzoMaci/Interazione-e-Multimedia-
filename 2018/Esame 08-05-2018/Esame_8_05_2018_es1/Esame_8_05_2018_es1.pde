PImage Im;
int K = (10 * 1) + 1;
color c;

void setup(){
  size(1024,512);
  
  Im = loadImage("lena.png");
  Im.resize(512,512);
}

void draw(){
   //imagine orginale a sinsitra
   image(Im, 0, 0);
   
   noFill();
   stroke(0,255,0);
   rectMode(CENTER);
   
  if(mouseX < Im.width-K/2 && mouseX > K/2 && mouseY < Im.height-K/2 && mouseY > K/2){
    c = regionMean(Im, mouseX, mouseY, K);
    Im.filter(c);
    
    rect(mouseX,mouseY,K,K);
  }
  else if(mouseX > Im.width-K/2){ //esco a destra
    c = regionMean(Im, Im.width-K/2, mouseY, K);
    Im.filter(c);
    rect(Im.width-K/2,mouseY,K,K);

  }
  else if(mouseX < K/2){ //esco a sinistra
    c = regionMean(Im, K/2, mouseY, K);
    Im.filter(c);
    rect(K/2,mouseY,K,K);
  }
  else if(mouseY < K/2){ //esco sopra
    c = regionMean(Im, mouseX, K/2, K);
    Im.filter(c);
  rect(mouseX,K/2,K,K);

  }
   
   else if(mouseY > Im.height-K/2){ //esco sotto
    c = regionMean(Im, mouseX, Im.height-K/2, K);
    Im.filter(c);
    rect(mouseX, Im.height-K/2,K,K);


  }
    
  rectMode(CORNER);
  noStroke();
  fill(c);
  rect(Im.width, 0, 512, 512);
}
void keyPressed(){
   if(key == '+' && K < 250){
      K += 10;
   }
   else if(key == '-' && K > 10){
      K -= 10;
   }  
}
