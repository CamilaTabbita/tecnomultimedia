void mousePressed() { 

  if (estado==1) {
    if (mouseButton == LEFT)
      DistanciaX[0] = 600;

    DistanciaY[0] = PosY = height/2;
    DistanciaX[1] = 900;
    DistanciaY[1] = 500;
  }

}

void keyPressed() { 

  if (estado==1) { 
    DistanciaX[0] = 600;
    DistanciaY[0] = PosY = height/2;
    DistanciaX[1] = 900;
    DistanciaY[1] = 500;
  }

}
