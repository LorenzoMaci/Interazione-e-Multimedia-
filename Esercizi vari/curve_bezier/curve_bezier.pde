void setup(){
  size(500,500);
  noFill(); //per rimuovere la parte piena della delle curve di bezier
}

void draw(){
  background(255); //per evitare che si formano più line 
  stroke(255,100,0);
  line(185,50, mouseX, mouseY);
  line(15,290,190,300);
  stroke(0);
  bezier(185,50, mouseX, mouseY, 15,290, 190, 300);
}
