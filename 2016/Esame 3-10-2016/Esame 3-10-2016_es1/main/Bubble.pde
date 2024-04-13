class Bubble{
   float x;
   float y;
   float v;
   float d;

  Bubble(float x, float y, float v, float d){
     this.x = x;
     this.y = y;
     this.v = v;
     this.d = d;
  }
  
   void display(){
     fill(#85D6F5);    
     ellipse(x, y, d, d);
     
     fill(255, 255, 255, 100);
     ellipse(x - d/4, y - d/4, d/4, d/4);
   }
   
   void move(){
      y -= v;
      
      if(y < 0){
         y = height; 
      }
   }
}
