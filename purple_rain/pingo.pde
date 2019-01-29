class pingo {
  float x, y;
  float velocidade, aceleracao;

  pingo () {
   inicia();
  }

  private void inicia() {
    x = random(0, width);
    y = 0;
    aceleracao = 0;
    velocidade = random(2, 8);
  }

  void update() {
    if (y >= height/10) {
      aceleracao += 0.003;
    }
    velocidade += aceleracao;
    y += velocidade;

    if (y >= height) {
      inicia();
    }
  }

  void show() {
    fill(#960AB4);
    rect(x, y, 3, 18+aceleracao);
  }
}
