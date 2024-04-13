float x;
float y;

void setup(){
  size(500,500);
  noStroke();
  
  x = width/2;
  y = height/2;
}

void draw(){
  //Con questo codice faccio muovere la nostra circonferenza 
  //background(0); //tolgo questo per permettere una scia
  fill(0, 10); //sostituisco il background così e aggiungo una trasparenza
  rect(0,0, width, height);
  x = lerp(x, mouseX, 0.3);
  y = lerp(y, mouseY, 0.3);
  fill(255); //aggiungo questo fill per il cerchio per farlo diventare bianco
  ellipse(x,y,60,60);
}
