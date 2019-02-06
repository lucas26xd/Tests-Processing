class foguete {
  //Variáveis úteis  
  int g = -1, fade = 255, fr = 0;
  float x, y = height, ymax, velocidade;
  color cor;
  boolean estorou = false;
  ArrayList<PVector> brilhos = new ArrayList<PVector>();

  //Construtor de inicialização das variáveis pertencentes a cada fogo de artifício
  foguete() {
    x = random(100, width - 100); //Posição aleatória em relação ao eixo x
    ymax = random(height/5, height/2); //Valor máximo de altura dos fogos ficam nesta faixa de 1/5 e 1/2 da tela
    velocidade = random(4, 8); //Velocidade de 4 a 8 pixels
    cor = color(random(255), random(255), random(255)); //Cor tambem aleatória
    estorar(); //Método de sorteio de onde ficaram seus brilhos
  }

  void estorar() {
    //translate(x, ymax);
    for (int i = 0; i < 800; i++) {
      //Por ser uma distribuição uniforme, probabilisticamente os brilhos formaram um círculo com centro sendo o fogo, sendo assim apenas mudei aleatoriamente de 8 a 100 suas distãncias em relação ao centro
      brilhos.add(PVector.random2D().mult(random(5, random(100, 120))));
    }
    //resetMatrix();
  }

  //Método para mostrar os fogos nas suas devidas posições sendo representados por um círculo com sua cor previamente escolhida
  void show() {
    noStroke();
    if (!estorou) {
      fill(cor);
      ellipse(x, y, 5, 5);
    } else {
      if (frameCount - fr < 10) { //O fogo fica amarelo por 15 frames para representar a explosão
        fill(255, 255, 0, 180);
        ellipse(x, y, 5, 5);
      } else {
        play(); //Executa som de estouro
        fr = -1; //Usado agora como flag para indicar que as posições dos brilhos podem ser atualizadas e som ser executado
        fill(cor, fade);
        fade--;
        if (fade < 0)
          fade = 0;
        push();
        translate(x, ymax);
        for (PVector b : brilhos) {
          int r = int(random(1, 3));
          ellipse(b.x, b.y, r, r);
        }
        //resetMatrix();
        pop();
      }
    }
  }

  //Método onde as posições dos fogos e dos seus respectivos brilhos são alteradas para a animação fluir
  void update() {
    if (y >= ymax) {
      y -= velocidade + g;
    } else {
      estorou = true;
      if (fr == 0)
        fr = frameCount;
      else if (fr == -1) {
        for (PVector b : brilhos) {
          b.y -= g; //Apenas a gravidade tem efeito, 'de cair'
        }
      }
    }
  }

  //Executa Som de Estouro
  void play() {
    if (fr != -1)
      file.play(1, 0.05);
  }
}
