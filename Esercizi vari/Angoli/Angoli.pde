size(500,500);
arc(90,260,80,80,0, HALF_PI); //6 parametri ed è una porzione di ellise
//Costanti con radianti noti, tipo 3,14 = PI, mezzo pigreco = HALF_PI
//Esite anche la funzione radians() dove metto l'angolo ad esempio 90 o 180 
arc(190,260,80,80,PI, PI+HALF_PI);
arc(290,260,80,80,QUARTER_PI, PI+HALF_PI,CHORD); //TWO_PI è due volte pigreco 
//Si può utilizzare OPEN per lasciare l'arco aperto, CHORD che segna la corda e PIE di defult
