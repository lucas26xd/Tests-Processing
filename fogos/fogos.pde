PImage img;
ArrayList<foguete> f = new ArrayList<foguete>();

//Carregando imagem de fundo e tela
void setup(){
  img = loadImage("ceu.jpg");
  size(1024, 388);
}

//Método de desenho, executado por padrão 60 vezes por segundo, 60fps
void draw(){
  background(img); //Seta a imagem como fundo da tela
  
  if(frameCount % 30 == 0){ //A cada meio segundo (com a taxa de 60fps) é 'lançado' um novo foguete
    f.add(new foguete());
  }
  
  for(int i = f.size()-1; i >= 0; i--){
    f.get(i).update(); //Atualiza sua posição
    f.get(i).show(); //Mostra cada fogo de artifício na tela
    if(f.get(i).fade == 0) //Se o mesmo já apagou, remove-o da lista
      f.remove(i);
  }
  //println(f.size());
}
