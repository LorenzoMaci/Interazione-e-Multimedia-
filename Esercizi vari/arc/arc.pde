size(500,500);
arc(90,60,80,80, 0, HALF_PI);
arc(190,60,80,80, 0, PI+HALF_PI, OPEN); 
arc(290,60,80,80, PI, 2*PI + HALF_PI, CHORD); // PI è 180 gradi (angolo iniziale),360 che poi diventa zero (TWO_PI)+ pigreco mezzi
arc(390,60,80,80, radians(30), radians(330), PIE);
