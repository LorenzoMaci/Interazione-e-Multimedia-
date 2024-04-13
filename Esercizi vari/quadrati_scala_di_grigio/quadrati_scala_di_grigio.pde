int x = 40;
void setup(){
 size(500,500);
 noStroke();
}

void draw(){
  background(0);
  for(int j = 0; j <= height; j+=x){
    for(int i = 0; i<= width; i+=x){
       int grayValue = int(map(i + j, 0, width + height, 0, 255)); 
       fill(grayValue);
       rect(i, j,x, x); 
    }
  }
}
