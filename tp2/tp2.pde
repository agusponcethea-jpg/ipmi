

//cambia por tiempo
int pantalla1 = 0;
int tiempo;

String texto = "START"; //se realiza para que mills funcione

//imagenes
PImage fondo;
PImage pasteleria;
PImage vestidor;
PImage escuela;



void setup() {
  size(640, 480);

  textSize(32);
  tiempo = millis();
}

void draw() {

  if (pantalla1 == 0) {

    fondo = loadImage("Purble_Place_7 (1).png");
    image(fondo, 0, 0, 640, 480);

    if (frameCount % 60 < 30) {
      fill(150, 40, 280);
      text(texto, 250, 400);
    }

    if (millis() - tiempo > 5000) {
      pantalla1 = 1;
      tiempo = millis();
    }
  }

  // pantalla 2
  else if (pantalla1 == 1) {

    pasteleria = loadImage("e5zsawwckak61.jpg");
    image(pasteleria, 0, 0, 640, 480);

    fill(150, 40, 280);
    text("podemos hornear los pasteles...", 90, 460);

    if (millis() - tiempo > 5000) {
      pantalla1 = 2;
      tiempo = millis();
    }
  }

  // pantalla 3
  else if (pantalla1 == 2) {

    vestidor = loadImage("MV5BZWE4OGYyZjctYjA5NS00NWFiLWIzYjYtMDU1NWY3MjAzODBmXkEyXkFqcGc@._V1_ (1).jpg");
    image(vestidor, 0, 0, 640, 480);

    fill(150, 40, 280);
    text("podremos escoger las prendas...", 90, 400);

    if (millis() - tiempo > 5000) {
      pantalla1 = 3;
      tiempo = millis();
    }
  }

  else if (pantalla1 == 3) {

    escuela = loadImage("5fe11cac2bbc187d5b5836ca890482eb.jpg");
    image(escuela, 0, 0, 640, 480);

    fill(0);
    text("recuerda cuales cartas coinciden", 90, 470);

    if (millis() - tiempo > 5000) {
      pantalla1 = 0;
      tiempo = millis();
    }
  }
}

void keyPressed() {
  // aca con el espacio volvemos al inicio :D 
  if (key == ' ') {
    pantalla1 = 0;
  
  }
}
