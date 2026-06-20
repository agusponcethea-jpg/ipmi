

//Adjunto enlace del video explicativo:https://youtu.be/gWRHejwDAYU

PImage referencia;

int b; // blanco
int n; // negro

// Variables para lerpColor
color colorInicio;
color colorActual;
color colorObjetivo;

float t = 1;

void setup() {
  size(800, 400);

  referencia = loadImage("32.png");

  colorActual = color(255);
  colorInicio = colorActual;
  colorObjetivo = colorActual;

  b = 255;
  n = 0;
}

void draw() {

  background(255);

  image(referencia, 0, 0, 400, 400);

  // Transición suave entre colores
  if (t < 1) {
    t += 0.02;
    colorActual = lerpColor(colorInicio, colorObjetivo, t);
  }

  // Invertir colores con ESPACIO
  if (keyPressed && key == ' ') {
    b = 0;
    n = 255;
  } else {
    b = 255;
    n = 0;
  }

  for (int fila = 0; fila < 2; fila++) {

    for (int columna = 0; columna < 2; columna++) {

      int xBase = 400 + columna * 200;
      int yBase = fila * 200;

      for (int i = 0; i < 17; i++) {

        int ancho = 200 - i * 10;
        int alto = 200 - i * 10;

        int x = xBase;
        int y = yBase;

        // Ajustes según el cuadrante
        if (columna == 0) {
          x += i * 10;
        }

        if (fila == 0) {
          y += i * 10;
        }

        // Movimiento solamente mientras el mouse está presionado
        if (mousePressed) {

          float movX = map(mouseX, 0, width, -30, 30);
          float movY = map(mouseY, 0, height, -30, 30);

          x += int(movX * i * 0.3);
          y += int(movY * i * 0.3);
        }

        // Alternancia de colores
        boolean blanco = (i % 2 == 0);

        // Invertir cuadrantes superior derecho e inferior izquierdo
        if ((fila == 0 && columna == 1) ||
            (fila == 1 && columna == 0)) {
          blanco = !blanco;
        }

        if (blanco) {

          if (keyPressed && key == ' ') {
            fill(b);
          } else {
            fill(colorActual);
          }

        } else {

          if (keyPressed && key == ' ') {
            fill(n);
          } else {
            fill(
              255 - red(colorActual),
              255 - green(colorActual),
              255 - blue(colorActual)
            );
          }
        }

        noStroke();
        rect(x, y, ancho, alto);
      }
    }
  }

}

void keyPressed() {

  // cambio de colores "C"
  if (key == 'c' || key == 'C') {

    colorInicio = colorActual;

    colorObjetivo = color(
      random(255),
      random(255),
      random(255)
    );

    t = 0;
  }

  // Reset al inicio "R"
  if (key == 'r' || key == 'R') {

    colorActual = color(255);
    colorInicio = colorActual;
    colorObjetivo = colorActual;

    t = 1;
    b = 255;
    n = 0;
  }
}
