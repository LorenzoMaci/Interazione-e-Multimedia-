ArrayList<Bubbles> bubbl = new ArrayList<Bubbles>();
ArrayList<Fish> fish = new ArrayList<Fish>();

void setup(){
   size(500,500);
   frameRate(60);
   background(#ADD8E6);
   
   //Starter Fish
   fish.add(new Fish(-50, random(50, 450), random(1, 4), random(-1.5, 1.5), color(random(255), random(255),random(255))));
}

void draw(){
    background(#ADD8E6);
    
    for(int i=0; i<bubbl.size(); i++){
        Bubble genBubble = bubbl.get(i);
        genBubble.display();
        genBubble.move();
    }
    
    for(int i=0; i<fish.size(); i++){
       Fish genFish = fish.get(i);
       genFish.display();
       genFish.move();
       
       if(random(100) < 2){
          bubble.add(genFish.generateBubble());
       }
    }
}

void keyPressed(){
   if(key == 'n' && key == 'N'){
      fish.add(new Fish(-50, random(50, 450), random(1, 4), random(-1.5, 1.5), color(random(255), random(255),random(255))));
   }
}
