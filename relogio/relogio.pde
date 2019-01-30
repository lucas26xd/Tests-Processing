PFont fonte;

float seg, min, hora;
boolean btn1 = true, btn2 = true, btn3 = true;

void setup() {
  size(500, 500);

  fonte = createFont("RobotoMono-Medium.ttf", 42);
  textFont(fonte);
  textAlign(CENTER, CENTER);

  strokeCap(ROUND);
  stroke(255);
  strokeWeight(8);
  fill(255);
}

void draw() {
  background(51);
  translate(width/2, height/2);

  seg = map(second(), 0, 59, 0, TWO_PI);
  min = map(minute(), 0, 59, 0, TWO_PI);
  hora = map(hour() % 12, 0, 11, 0, TWO_PI);

  if(btn3)
    fazArcos();
  if(btn1)
    fazPonteiros();
  if(btn2)
    fazTexto();

  fazBotoes();
}

void fazArcos() {
  push();
  noFill();
  rotate(- HALF_PI);
  stroke(255, 100, 150);
  arc(0, 0, 400, 400, 0, hora);
  stroke(150, 100, 255);
  arc(0, 0, 380, 380, 0, min);
  stroke(100, 255, 100);
  arc(0, 0, 360, 360, 0, seg);
  pop();
}

void fazPonteiros() {
  push();
  rotate(seg - HALF_PI);
  stroke(100, 255, 100);
  line(0, 0, 100, 0);
  pop();
  push();
  rotate(min - HALF_PI);
  stroke(150, 100, 255);
  line(0, 0, 75, 0);
  pop();
  push();
  rotate(hora - HALF_PI);
  stroke(255, 100, 150);
  line(0, 0, 50, 0);
  pop();
  point(0, 0);
}

void fazTexto() {
  String texto = (hour() < 10 ? "0" : "") + hour() + ":" + 
    (minute() < 10 ? "0" : "") + minute() + ":" + 
    (second() < 10 ? "0" : "") + second();
  text(texto, 0, (btn1 ? 60 : 0));
}

void fazBotoes() {
  push();
  strokeWeight(2);
  textFont(fonte, 18);
  textAlign(LEFT, CENTER);

  if (btn1)
    fill(0, 0, 255);
  else
    fill(255);
  rect((width/2)-(width-30), (height/2)-30, 20, 20);
  text("[1]Ponteiros", (width/2)-(width-60), (height/2)-30);

  if (btn2)
    fill(0, 0, 255);
  else
    fill(255);
  rect((width/2)-(width-200), (height/2)-30, 20, 20);
  text("[2]Timer", (width/2)-(width-230), (height/2)-30);

  if (btn3)
    fill(0, 0, 255);
  else
    fill(255);
  rect((width/2)-(width-350), (height/2)-30, 20, 20);
  text("[3]Arcos", (width/2)-(width-380), (height/2)-30);
  pop();
}

void keyPressed() {
  if (key == '1')
    btn1 = !btn1;
  if (key == '2')
    btn2 = !btn2;
  if (key == '3')
    btn3 = !btn3;
}
