void setup(){
 size(500,500); 
}

void draw(){
    background(255, 255, 0);
    fill(255);
    ellipse(width/2 -30, height/2 , 50, 50); //Cerchio padre
    fill(0);
    fill(255);
    ellipse(width/2 + 30, height/2 , 50, 50);
    fill(0);
    float x = map(mouseX, 0, width, -15, 15);
    float y = map(mouseY, 0, height, -15, 15);
    ellipse(width/2 - 30 + x  , height/2 + y, 10, 10); //cerchio piccolo che si muove nell'area di quello grande
    ellipse(width/2 + 30+ x  , height/2 + y, 10, 10);
}
