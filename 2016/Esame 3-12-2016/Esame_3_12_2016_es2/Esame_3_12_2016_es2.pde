PImage imgRGB;
PImage imgCMY;
PImage imgCMYConverted;

void setup() {
  size(900, 300);
  
  // Carica un'immagine RGB
  imgRGB = loadImage("lena.png");
  
  // Ridimensiona l'immagine se necessario per adattarla alla finestra
  imgRGB.resize(width / 3, height);
  
  // Converti l'immagine RGB in CMY
  imgCMY = rgb2cmy(imgRGB);
  
  // Crea un'immagine vuota per l'immagine CMY convertita in RGB
  imgCMYConverted = createImage(imgCMY.width, imgCMY.height, RGB);
  
  // Converte l'immagine CMY in RGB
  cmy2rgb(imgCMY, imgCMYConverted);
}

void draw() {
  background(255);
  
  // Visualizza l'immagine RGB originale a sinistra
  image(imgRGB, 0, 0);
  
  // Visualizza l'immagine CMY al centro
  image(imgCMY, width / 3, 0);
  
  // Visualizza l'immagine CMY convertita in RGB a destra
  imageCMY(imgCMYConverted, 2 * width / 3, 0);
  
  // Didascalie
  textAlign(CENTER);
  textSize(12);
  fill(0);
  text("RGB Originale", width / 6, height - 10);
  text("CMY in RGB", width / 2, height - 10);
  text("CMY Corretta", 5 * width / 6, height - 10);
}

// Funzione per convertire un'immagine RGB in CMY
PImage rgb2cmy(PImage imgRGB) {
  PImage imgCMY = createImage(imgRGB.width, imgRGB.height, RGB);
  
  loadPixels();
  imgRGB.loadPixels();
  imgCMY.loadPixels();
  
  for (int i = 0; i < imgRGB.pixels.length; i++) {
    color c = imgRGB.pixels[i];
    float r = red(c) / 255.0;
    float g = green(c) / 255.0;
    float b = blue(c) / 255.0;
    
    float cyan = 1 - r;
    float magenta = 1 - g;
    float yellow = 1 - b;
    
    imgCMY.pixels[i] = color(cyan * 255, magenta * 255, yellow * 255);
  }
  
  imgCMY.updatePixels();
  
  return imgCMY;
}

// Funzione per convertire un'immagine CMY in RGB
void cmy2rgb(PImage imgCMY, PImage imgRGB) {
  imgCMY.loadPixels();
  imgRGB.loadPixels();
  
  for (int i = 0; i < imgCMY.pixels.length; i++) {
    color c = imgCMY.pixels[i];
    float cyan = red(c) / 255.0;
    float magenta = green(c) / 255.0;
    float yellow = blue(c) / 255.0;
    
    float r = (1 - cyan) * 255;
    float g = (1 - magenta) * 255;
    float b = (1 - yellow) * 255;
    
    imgRGB.pixels[i] = color(r, g, b);
  }
  
  imgRGB.updatePixels();
}

// Funzione per visualizzare un'immagine CMY convertita in RGB
void imageCMY(PImage imgCMY, int x, int y) {
  PImage imgRGB = createImage(imgCMY.width, imgCMY.height, RGB);
  cmy2rgb(imgCMY, imgRGB);
  image(imgRGB, x, y);
}
