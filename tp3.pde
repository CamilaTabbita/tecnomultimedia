

PImage fondo;
PImage player;
PImage obstaculo;
PImage portada;
PImage creditos;
PImage gameover;

int estado = 1; 
int pantalla = 1;
int puntos = 0, puntosMaximos = 0; 
int PosX = -200, PosY = 350; 
int DistanciaX[] = new int[2], DistanciaY[] = new int[2];

void setup() { 
    size(600, 700); 
    fill(0); 
    textSize(35);  
    fondo = loadImage("fondoEspacio.png");
    player = loadImage("astronautaPlayer.png");
    obstaculo = loadImage("laser.png");
    portada = loadImage("inicio.jpg");
    creditos = loadImage("creditos.jpg");
    gameover = loadImage("gameover.jpg");
    
}

void draw() {  
    if(estado == 0) { 
        imageMode(CORNER);
        image(fondo, PosX, 0);
        image(fondo, PosX + fondo.width, 0);
        PosX-= 5;

        
        
        if (mousePressed) {
            if (mouseButton == LEFT)
                PosY += -10;
            
            if (mouseButton == RIGHT)
                PosY += 10;
        }  
        
        
        if (PosX == -1800) PosX = 0; 
        for (int i = 0; i < 2; i++) { 
            imageMode(CENTER);
            image(obstaculo, DistanciaX[i], DistanciaY[i] - (obstaculo.height / 2 + 100));
            image(obstaculo, DistanciaX[i], DistanciaY[i] + (obstaculo.height / 2 + 100));
           if (DistanciaX[i] < 0) {   
                DistanciaY[i] = (int)random(200, height - 200);
                DistanciaX[i] = width;
        }
           if (DistanciaX[i] == width / 2) { 
                puntos++;
                puntosMaximos = max(puntos, puntosMaximos);
        }
           if (PosY > height ||  PosY < 0 ||  (abs(width / 2 - DistanciaX[i])<25 && abs(PosY - DistanciaY[i])>100)) { 
                estado = 1;
        }
            DistanciaX[i] -= 8;
        }
        image(player, width / 2, PosY); 
        text("" + puntos, width / 2 - 15, 100);
} else { 
        if (pantalla == 1) { 
            imageMode(CENTER);
            image(portada, 300, 350);  
            botonA();
            fill(255);
            textSize(30);
            text("Oprima el boton verde para iniciar", 20, 550);
            text("Click izquierdo para subir", 10, 100);
            text("Click derecho para bajar", 10, 150);
        }
        if (pantalla == 2) { 
            image(creditos, 300, 350);
            botonA();
            creditos(width / 3, 500);
        }
        
        if (pantalla == 3) { 
            image(gameover, 300, 350);    
            fill(0, 255, 0);
            ellipse(25, 25, 50, 50);
            fill(232, 252, 217);
            text("Máxima puntuación: " + puntosMaximos, 90, width - 50);
            text("Boton rojo para volver al inicio", 25, 90);
            text("Boton verde para volver a jugar", 25, 130);
            botonR();
            frameCount = 0;
        }
}
}
