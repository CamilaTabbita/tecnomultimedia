//MIS VARIABLES
PImage imagen1, imagen2,imagen3,botonInicial;
PFont fuenteTitulo, fuenteSubtitulo;
int posicionDelTexto;
boolean botonInicoPresionado;
int botonInicialX, botonInicialY, botonInicialAncho, botonInicialAlto;
String textoPantalla2, textoPantalla3,textoPantalla4;
int tiempoDeInicio;
int pantallaActual;



void setup() {
    pantallaActual = 1;
    //declaraciones
    imagen1 = loadImage("fondo1.jpg");
    imagen2 = loadImage("fondo 2.jpg");
    imagen3 = loadImage("fondo3.jpg");
    botonInicial = loadImage("botonplay.png");
    fuenteTitulo = createFont("AHS.otf",50);
    fuenteSubtitulo = loadFont("Candara-30.vlw");
    botonInicoPresionado = false;
    posicionDelTexto = 1;
    
    botonInicialX = 350;
    botonInicialY = 400;
    botonInicialAncho = 100;
    botonInicialAlto = 100;
    
    tiempoDeInicio = 0;
    
    textoPantalla2 = "PERSONAJES \n\n\n Alicia Spencer \n Anna Leighton \n Cordelia Fox \n Luke Ramsein \n Misty Day \n Mirtle Snow \n Zoe Benson \n Papa Legba";
    textoPantalla3 = "MUSICA\n\n\nFrédéric Mercier - Spirit/n Raffertie - Last Train Home \n Iron Butterfly - In-A-Gadda-Da-Vida (Single Version) \n Foxe Basin - Sieze the Night (Francophilippe Remix) \n Calla - Custom Car Crash \n Sara Bareilles & Ingrid Michaelson - Winter Song \n Papa Mali - Sugarland \n Lauren O'Connell - House of the Rising Sun \n Suuns - Pie X \n Ring Tony & DJ Thanos - 'Coven Theme' (Seven Wonders Remix)";
    textoPantalla4 = "GUIONISTAS\n\n\n Brad Champluck \n Ryan Murphy \n IronMan \n Cenicienta \n\n DIRECTORES\n\n\n Leonardo DiCaprio \n Jeniffer Lopez \n Rocio Oliva \n\n DIRECTORES\n\n\n Edwar Cullen \n Justin Bierber\n Miley Cyrus\n Leonel Messi";
    //cargar configuraciones iniciales
    size(800,600);
    //asignacion
    
}

void draw() {
    if (pantallaActual == 1) {
        dibujarPantallaInicial();
    }
    
    if (pantallaActual == 2) {
        dibujarPantallaDos();
    }
    
    if (pantallaActual == 3) {
        dibujarPantallaTres();
    }
    if (pantallaActual == 4) {
        dibujarPantallaCuatro();
    }
    if (pantallaActual == 5) {
        dibujarPantallaCinco();
    }
    if (pantallaActual == 6) {
        dibujarPantallaInicial();
        pantallaActual = 1;
    }
    
    
}

void dibujarPantallaInicial() {
    background(#242323);
    textFont(fuenteTitulo, 50);
    text("AMERICAN HORROR STORY",200,300);
    textFont(fuenteSubtitulo, 25);
    text("Click izquierdo avanza Click derecho retrocede",300,550);
    
    image(botonInicial,botonInicialX,botonInicialY,botonInicialAncho,botonInicialAlto);
    if (mouseX > botonInicialX && mouseY > botonInicialY && mouseX < (botonInicialX + botonInicialAncho) && mouseY < (botonInicialY + botonInicialAlto)) { 
        cursor(HAND);
        if (mousePressed) {
            botonInicoPresionado = true;
        }   
    } else {
        cursor(ARROW); 
    }
    
    if (botonInicoPresionado) {
        pantallaActual = pantallaActual + 1;
        botonInicoPresionado = false;
    }
}


void dibujarPantallaDos() {
    background(#242323);
    image(imagen1,0,0,width,height);
    textFont(fuenteTitulo,40);
    text(textoPantalla2,300,posicionDelTexto);
    posicionDelTexto = posicionDelTexto + 2;
    
    irAPantalla();
}    

void dibujarPantallaTres() {
    background(#242323);
    image(imagen2,0,0,width,height);
    textFont(fuenteTitulo,35);
    text(textoPantalla3,100,posicionDelTexto);
    posicionDelTexto = posicionDelTexto + 2;
    
    irAPantalla();
}

void dibujarPantallaCuatro() {
    background(#242323);
    image(imagen3,0,0,width,height);
    textFont(fuenteTitulo,30);
    text(textoPantalla4,300,posicionDelTexto);
    posicionDelTexto = posicionDelTexto + 2;
    
    irAPantalla();
}
void dibujarPantallaCinco() {
    background(#242323);
    textFont(fuenteTitulo,45);
    text("Fin",100,posicionDelTexto);
    if (posicionDelTexto <= height / 2) {
        posicionDelTexto = posicionDelTexto + 2;
    } else {
        text("Click para volver a iniciar",300,500);
    }
    
    irAPantalla();
}

void irAPantalla() {
    if (posicionDelTexto >= height || (posicionDelTexto > 50)) {
        if (mousePressed && mouseButton == RIGHT) {
            pantallaActual = pantallaActual - 1;
            posicionDelTexto = 0;
            
        } else if (mousePressed && mouseButton == LEFT) {
            pantallaActual = pantallaActual + 1;
            posicionDelTexto = 0;
        } else if (posicionDelTexto >= height) {
            pantallaActual = pantallaActual + 1;
            posicionDelTexto = 0;
        }
    }
}
