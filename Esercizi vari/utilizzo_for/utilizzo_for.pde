size(800,500);
for(int i=20; i<=400; i+=20){ //i <= 400 condizione di permanenza
   stroke(0);
   line(i,0 ,i+i/2, height/2); //la i viene utilizzata come x e parte come bordo in alto nello schermo, 0, i+i/2 è dove conclude la nostra x, 
                                //height/2 voglio che la y finisca a metà dello schermo per questo scrivo così
   line(i,height ,i+i/2, height/2); //la x è sempre la stessa per la seconda linea, la y è alla fine dello schermo quindi height, i+i/2 è dove conclude la nostra x,
                                    //height/2 voglio che la y finisca a metà dello schermo per questo scrivo così
   stroke(255,0,0);
   line(20,i,60,i); //La i viene utilizzata come y e le prime due line sono nere, le altre rimarranno a rosse 
}
