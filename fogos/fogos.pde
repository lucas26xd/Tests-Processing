import processing.sound.*;
SoundFile file;
PImage img;
ArrayList<foguete> fgt = new ArrayList<foguete>();

//Carregando imagem de fundo e tela
void setup() {
  file = new SoundFile(this, sketchPath("estouro.mp3"));
  img = loadImage("ceu.jpg");
  size(1024, 388);
}

//Método de desenho, executado por padrão 60 vezes por segundo, 60fps
void draw() {
  background(img); //Seta a imagem como fundo da tela

  if (frameCount % 30 == 0) { //A cada meio segundo (com a taxa de 60fps) é 'lançado' um novo foguete
    fgt.add(new foguete());
  }

  for (int i = fgt.size()-1; i >= 0; i--) {
    fgt.get(i).update(); //Atualiza sua posição
    fgt.get(i).show(); //Mostra cada fogo de artifício na tela
    if (fgt.get(i).fade == 0) //Se o mesmo já apagou, remove-o da lista
      fgt.remove(i);
  }
  //println(fgt.size());
}
