pingo[] p = new pingo[500];

void setup(){
  size(600, 600);
  for(int i = 0; i < p.length; i++){
    p[i] = new pingo();
  }
}

void draw(){
  background(0);
  for(int i = 0; i < p.length; i++){
    p[i].update();
    p[i].show();
  }
}
