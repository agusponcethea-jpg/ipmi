int pantalla1 = 0;
int tiempo;

PImage fondo;
PImage pasteleria;
PImage vestidor;
PImage escuela;
PImage finalJuego;
PImage personajeVolando;
PImage personajeVolando2;
PImage boton;

int textY1 = 500;
int textY2 = 500;
int textY3 = 500;
int textY4 = 500;
int textY5 = 500;
int textY6 = 500;
int textY7 = 500;

int personajeX = -220;
int personajeY = 220;

void setup() {

  size(640, 480);

  textSize(32);
  tiempo = millis();

  fondo = loadImage("Purble_Place_7 (1).png");
  pasteleria = loadImage("pasteleria.jpg");
  vestidor = loadImage("vestidor.jpg");
  escuela = loadImage("escuela.png");
  finalJuego = loadImage("final.jpg");

  personajeVolando = loadImage("personaje.png");
  personajeVolando2 = loadImage("personaje2.png");
  boton = loadImage("boton.png");
}

void draw() {

  if (pantalla1 == 0) {

    image(fondo, 0, 0, width, height);

    personajeX += 3;

    if (personajeX > width + 100) {
      personajeX = -220;
    }

    image(personajeVolando, personajeX, personajeY, 200, 180);

    if (frameCount % 60 < 30) {
      image(boton, 220, 330, 200, 175);
    }

    if (textY1 > 400) {
      textY1 -= 2;
    }

    if (millis() - tiempo > 5000) {
      pantalla1 = 1;
      tiempo = millis();
    }
  }

  else if (pantalla1 == 1) {

    image(pasteleria, 0, 0, width, height);

    fill(255, 236, 18);
    text("Recrea los pasteles de la imagen", 90, textY2);

    if (textY2 > 240) {
      textY2 -= 2;
    }

    if (millis() - tiempo > 5000) {
      pantalla1 = 2;
      tiempo = millis();
    }
  }

  else if (pantalla1 == 2) {

    image(escuela, 0, 0, width, height);

    fill(0);
    text("Recuerda cuales cartas coinciden", 70, textY4);
    fill(255, 236, 18);
     text("y gana monedas a cambio!", 90, textY6);

    if (textY4 > 240) {
      textY4 -= 2;
    }

if (textY6 > 280) {
      textY6 -= 2;
    }

    if (millis() - tiempo > 5000) {
      pantalla1 = 3;
      tiempo = millis();
    }
  }

  else if (pantalla1 == 3) {

    image(vestidor, 0, 0, width, height);

    fill(150, 40, 280);
    text("Escoge prendas!", 70, textY3);
 text("impresiona al jurado!", 70, textY7);

    if (textY3 > 240) {
      textY3 -= 2;
    }
if (textY7 > 280) {
      textY7 -= 2;
    }


    if (millis() - tiempo > 5000) {
      pantalla1 = 4;
      tiempo = millis();
    }
    personajeX += 3;

    if (personajeX > width + 100) {
      personajeX = -220;
    }

    image(personajeVolando2, personajeX, personajeY, 130, 190);
    
    if (frameCount % 60 < 30) {
}
    
    
  }

  else if (pantalla1 == 4) {

    image(finalJuego, 0, 0, width, height);

    fill(226, 7, 227);
    text("Gracias por jugar", 220, textY5);

    if (textY5 > 165) {
      textY5 -= 2;
    }

    fill(150, 40, 280);
    rect(220, 400, 200, 70);

    fill(255);
    textSize(24);
    text("REINICIAR", 260, 440);
    textSize(32);
  }
}

void mousePressed() {

  if (pantalla1 == 4) {

    if (mouseX > 220 && mouseX < 420 && mouseY > 400 && mouseY < 470) {
      reiniciar();
    }
  }
}

void keyPressed() {

  if (key == ' ') {
    reiniciar();
  }
}

void reiniciar() {

  pantalla1 = 0;
  tiempo = millis();

  textY1 = 500;
  textY2 = 500;
  textY3 = 500;
  textY4 = 500;
  textY5 = 500;

  personajeX = -220;
}
