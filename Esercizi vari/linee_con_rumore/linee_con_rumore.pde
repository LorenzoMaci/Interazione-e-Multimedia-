void setup(){
   size(240, 120); 
}

void draw(){
 background(255);
 for(int x = 20; x < width; x+=20){  // questo for indica il numero di linee che ci saranno
     float rum = map(mouseX, 0, width, 0, 12); // rumore delle linee
     float rumi = random(-rum, +rum);
     float rumj = random(-rum, +rum);
     line(x + rumi, 20, x + rumj, 100);
 }
}
