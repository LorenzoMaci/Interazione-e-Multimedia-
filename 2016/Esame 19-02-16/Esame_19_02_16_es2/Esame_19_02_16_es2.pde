PImage LenaRGB;
char state = 'r';

void setup(){
   size(512,512);
   LenaRGB = loadImage("lena.png");
   LenaRGB.resize(256,256);
}

void draw(){
    background(255);
    
    image(LenaRGB,0,0, width/2, height/2);
    
    PImage channelImg = channel(LenaRGB, state);
    image(channelImg, width/2, 0, width/2, height/2);
     
     PImage redImg = channel(LenaRGB, 'r');
     PImage greenImg = channel(LenaRGB, 'g');
     PImage blueImg = channel(LenaRGB, 'b');
     image(redImg, 0, height/2, width/2, height/2);
     image(greenImg, width/2, height/2, width/2, height/2);
     image(blueImg, width/2, height/2, width/2, height/2);
}

void keyPressed(){
  if(key == 'r' || key == 'b' || key == 'g'){
     state = key;
  }else if(key == '+'){
     LenaRGB = changeColor(LenaRGB, state, 3); 
  }else if(key == '-'){
     LenaRGB = changeColor(LenaRGB,state, -3); 
  }
}
