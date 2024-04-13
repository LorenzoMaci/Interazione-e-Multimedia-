PImage LenaRGB;
int s = 80;
int x, y;
boolean firstClick = true;

void setup(){
  size(512, 512);
  LenaRGB = loadImage("lena.png");
  LenaRGB.resize(512, 512);
  
  image(LenaRGB,0,0);
}

void draw(){
   if(!firstClick){
       image(LenaRGB, 0, 0);
       noFill();
       noStroke();
       fill(0,0,200,40);
       rect(x,y,s,s);
       //Qui segno il rettangolo che premo con il mouse
       noFill(); 
       stroke(0);
       rectMode(CENTER);
       rect(mouseX,mouseY, s, s);
   }
   else{
      image(LenaRGB, 0,0);
      noFill();
      stroke(0);
      rectMode(CENTER);
      rect(mouseX, mouseY, s, s);
   }
}

void mousePressed(){
    if(firstClick){
      x = mouseX;
      y = mouseY;
      firstClick = false;
      
      // controlla se la posizione del rettangolo (selezionato) si sovrappone ai bordi dell'immagine.
      if(x-s/2 < 0) //controllo se sfora a sinistra
        x += s/2;
      if(y-s/2 < 0)//controllo se sforai in basso
        y += s/2;
        
       if(x + s/2 > width) //Controllo se sfora a destra
         x -= s/2;
       if(y + s/2 > height) //Controllo se sfora in alto
         y -= s/2;
    }
    else{
      LenaRGB = swap(LenaRGB, x, y, mouseX, mouseY, s);
      firstClick = true;
    }
}  

void keyPressed(){
   if(key == '+' && s <= 150 && firstClick){
       s += 10;
   }else if(key == '-' && s >= 30 && firstClick){
      s -= 10; 
   }
}
