// Video referencia = 

PImage referencia;

int b; //Color blanco
int n; //color negro

color colorInicio;
color colorActual;
color colorObjetivo;

float t = 1;

float angulo = 0;
boolean girar = false;

void setup() {
  size(800, 400);

  referencia = loadImage("32.png"); //imagen de referencia

  colorActual = color(255);
  colorInicio = colorActual;
  colorObjetivo = colorActual;

  b = 255;
  n = 0;
}

void draw() {

  background(255);

  image(referencia, 0, 0, 400, 400);

  if (girar) {
    angulo += 2;
  }

  if (t < 1) {
    t += 0.02;
    colorActual = lerpColor(colorInicio, colorObjetivo, t); //Cambia el color de forma lenta y no brusca
  }

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

        if (columna == 0) {
          x += i * 10;
        }

        if (fila == 0) {
          y += i * 10;
        }

        if (mousePressed) { //Mover cuadrados con Mouse pressed

          float movX = map(mouseX, 0, width, -30, 30);
          float movY = map(mouseY, 0, height, -30, 30);

          x += int(movX * i * 0.3);
          y += int(movY * i * 0.3);
        }

        boolean blanco = (i % 2 == 0);

        if ((fila == 0 && columna == 1) || (fila == 1 && columna == 0)) {
          blanco = !blanco;
        }

        dibujarRectanguloOp(x, y, ancho, alto, blanco, fila, columna, i);
      }
    }
  }
}

void dibujarRectanguloOp(int x, int y, int ancho, int alto, boolean blanco, int fila, int columna, int i) {

  noStroke();

  color colorDevuelto = elegirColor(blanco);

  if (frameCount % 30 == 0) {
    println("Funcion con retorno elegirColor()");
    println("Fila: " + fila);
    println("Columna: " + columna);
    println("Rectangulo numero: " + i);
    println("Color devuelto: " + colorDevuelto);
    println("--------------------");
  }

  fill(colorDevuelto);

  pushMatrix();

  translate(x + ancho / 2, y + alto / 2);

  rotate(radians(angulo));

  rect(-ancho / 2, -alto / 2, ancho, alto);

  popMatrix();
}

color elegirColor(boolean blanco) {

  if (blanco) {

    if (keyPressed && key == ' ') {
      return color(b);
    } else {
      return colorActual;
    }

  } else {

    if (keyPressed && key == ' ') {
      return color(n);
    } else {
      return color(
        255 - red(colorActual),
        255 - green(colorActual),
        255 - blue(colorActual)
      );
    }
  }
}

void keyPressed() {

  if (key == 'c' || key == 'C') { //Letra C para cambiar de color

    colorInicio = colorActual;

    colorObjetivo = color(
      random(255),
      random(255),
      random(255)
    );

    t = 0;
  }

  if (key == 'g' || key == 'G') { //Letra G para girar.
    girar = !girar;
  }

  if (key == 'r' || key == 'R') { //Con letra R se reinicia a 0

    colorActual = color(255);
    colorInicio = colorActual;
    colorObjetivo = colorActual;

    t = 1;
    b = 255;
    n = 0;

    girar = false;
    angulo = 0;
  }
}
