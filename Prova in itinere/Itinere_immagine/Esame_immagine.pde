PImage imgRGB;
PImage imgGray;
boolean salvaBit = false;

void setup(){
  size(900,800);
  imgRGB = loadImage("immagineProfilo.jpg");  // loadImage è una funzione che permette di caricare un immagine 
  imgRGB.resize(width/3, height); //ridimenziona l'immagine originale .resize
  imgGray = ImToGray(imgRGB); //chiama la funziona ImToGray che converte l'immagine RGB a scala di grigi
}

void draw(){
    image(imgRGB, 0, 0); //mette l'immagine rgb a sinistra
    
    image(imgGray, width/3, 0); //mette l'immagine a scala di grigio al centro
    
   int bitplane = constrain(key - '0', 1, 8 ); //permette di applicare l'interpolazione nei bitplane
   PImage imgBitPlane = estraiPianoN(imgGray, bitplane); //chiama la funzione estrai piano
   image(imgBitPlane, width*2/3, 0);  //mette l'immagine in bianco e nero a destra 
}

void keyPressed(){
  if(key == 's' && !salvaBit){ // se premi s e salvaBit non è vero (per poterlo fare solo una volta) richiama la funzione salvaBitPlane dell'immagine in bianco e nero
    salvaBitPlane(imgGray);
    salvaBit = true;
  }
} 

PImage ImToGray(PImage imgRGB){
    PImage imgGray = createImage(imgRGB.width, imgRGB.height, ALPHA); // crea l'immagine in scala di grigio tramite la funzione createImage  
    imgGray.loadPixels(); // carica i pixel dell'immagine in un array 
    imgRGB.loadPixels(); 
    
    for(int x = 0; x<imgRGB.width; x++){
      for(int y = 0; y<imgRGB.height; y++){
         int loc = x + y * imgRGB.width; // indice che calcola la posizione del pixel all'interno dell'array
         float r = red(imgRGB.pixels[loc]) * 0.5; //operazione che modifica il piano di bit rosso
         float g  = green(imgRGB.pixels[loc]) * 0.2; // operazione che modifica il piano di bit verde
         float b = blue(imgRGB.pixels[loc]) * 0.3; // operazione che modifica il piano di bit blu
         int grayValue = int(r+g+b); // calcolo il valore d'intensità in scala di grigi che si ottiene sommando i valori
         imgGray.pixels[loc] = color(grayValue); //assegno ai pixel della posizione loc dell'immagine a scala di grigio, il colore grigio assegnato
      }
    }
    imgGray.updatePixels(); // aggiorno l'immagine grigia per le operazioni che ho fatto
    return imgGray; 
}

PImage estraiPianoN(PImage imgGray, int n){
    PImage BW = createImage(imgGray.width, imgGray.height, ALPHA); //crea l'immagine BeW tramite la funzione createImage
    BW.loadPixels();
    imgGray.loadPixels();
    
    n = constrain(n , 1, 8); // serve a Limitare un valore a non superare un valore massimo e minimo.
    for(int i = 0; i < imgGray.pixels.length; i++){ // scprre tutti i pixel dell'immagine a scala di grigio
       float grayValue = (imgGray.pixels[i] >> (n - 1)) & 1; // per ogni pixel si estrare il bit n-esimo, '>>' serve a eseguire uno shit a destra bit a bit del valore del pixel di n -1 posizioni, '&1' serve a effettuare un'operazione AND bit a bit con 1, che consente di isolare il bit meno significativo ì
       grayValue *= 255; //effettuo la normalizzazione quindi moltiplico ogni valore del pixel * 255
       
       BW.pixels[i] = color(grayValue); //assegno ai pixel della posizione 'i' dell'immagine BeW, il valore tra 0 e 1 ottenuto
    }
    
    BW.updatePixels();
    return BW;
}

void salvaBitPlane(PImage imgGray) {
  for (int i = 1; i <= 8; i++) {
    PImage imgBitplane = estraiPianoN(imgGray, i); //assegno i vari bitplane dell'immagine da salvare
    imgBitplane.save("b" + i + ".png"); //salva in formato png 'i' immagini 
  }
}
