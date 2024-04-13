class SaettaLampegginante extends Saetta{
  boolean view = true;
  int update = millis();
  int intervallo = 200;
  
  SaettaLampegginante(float x){
    super(x);  
  }
  
  void display(){
     if(view){
      fill(255);
      triangle(x, y, x, y - h/2, x - l/2, y);
      triangle(x, y, x, y + h/2, x + l/2, y);
     }       
  }
  
  void move(){
     super.move();
     
     int now = millis();
     if(now - update > intervallo){ //per fare sparire e riapparire il lampo
        view = !view; 
        update = now;
     }
  }
  
  void run(){
     move();
     display();
  }
}
