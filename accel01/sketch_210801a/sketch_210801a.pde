import processing.serial.*;
Serial serial;

int ballX = 0;

void setup() {
  size(800, 600);
  serial = new Serial(this, "COM3", 9600);
}

void draw() {
  background(255, 255, 255);
  ellipse(ballX, height / 2, 100, 100);

  /* ボールを動かす */
  while (serial.available() > 0) {
    char c = serial.readChar();
    if (c == 'a'){
      ballX++;
      println("a");
    }
  }
}
