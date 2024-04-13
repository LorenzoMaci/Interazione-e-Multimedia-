void setup() {
size(394, 319);
background(0);

}

void draw() {
  noStroke();
  fill(230);
  ellipse(width / 2, height / 2, 220, 190);
  fill(0);
  //rect(115, 160, 60, 12, 50);
  //quad(115, 160, 110, 170, 166, 180, 170, 170);          occhio sinistro
  //quad(225, 172, 228, 182, 282, 170, 280, 160);        occhio destro
  //rect(225, 160, 60, 12, 50);
  triangle(width / 2, 220, 177, 205, 217, 205);
  fill(230);
  triangle(100, 120, 135, 85, 100, 70);
  //stroke(0);
  //strokeWeight(6);
  //point(100, 120);
  //point(135, 85);
  //point(100, 70);
  //point (295, 120);
  //point(295, 70);
  //point(260, 85);
  triangle(295,  120, 260, 85, 295, 70);
  stroke(0);
  strokeWeight(10);
  point(115, 95);
  point(280, 95);
  //point(112, 164);               punto per occhio sinistro
  strokeWeight(10);
  //point(167, 174);               punto per occhio sinistro
  //point(226, 176);             punto per occhio destro
  //point(282, 164);              punto per occhio destro
  line (115, 160, 170, 170);        //occhio destro con line
  line (225, 170, 280, 160);          //occhio sinistro con line
}
