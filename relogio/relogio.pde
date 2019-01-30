float seg, min, hora;

void setup() {
  size(500, 500);

  PFont fonte = createFont("RobotoMono-Medium.ttf", 40);
  textFont(fonte);
  textAlign(CENTER, CENTER);

  strokeCap(ROUND);
  //stroke(255);
  strokeWeight(8);
  fill(255);
}

void draw() {
  background(51);
  translate(width/2, height/2);

  seg = second();
  min = minute();
  hora = hour() % 12;

  push();
  noFill();
  rotate(-HALF_PI);
  stroke(255, 100, 150);
  arc(0, 0, 400, 400, 0, map(hora, 0, 11, 0, TWO_PI));
  stroke(150, 100, 255);
  arc(0, 0, 380, 380, 0, map(min, 0, 59, 0, TWO_PI));
  stroke(100, 255, 100);
  arc(0, 0, 360, 360, 0, map(seg, 0, 59, 0, TWO_PI));
  pop();

  String texto = (hora < 10 ? "0" : "") + floor(hora) + " : " + 
                 (min < 10 ? "0" : "") + floor(min) + " : " + 
                 (seg < 10 ? "0" : "") + floor(seg);
  text(texto, 0, 0);
}
