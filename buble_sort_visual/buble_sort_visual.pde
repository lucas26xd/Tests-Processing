import javax.swing.JOptionPane;

float[] vetor = new float[25];
float aux;
int x, l = 40, i = 0;
boolean ordenado;

void setup() {
  size(1000, 600);
  for (int i = 0; i < vetor.length; i++) {
    vetor[i] = random(height);
  }
  //frameRate(100);
}

void draw() {
  background(0);

  if (i >= vetor.length-1)
    i = 0;
  if (vetor[i] > vetor[i+1]) {
    aux = vetor[i];
    vetor[i] = vetor[i+1];
    vetor[i+1] = aux;
  }
  i++;
  
  x = 0;
  aux = vetor[0];
  ordenado = true;
  for (float a : vetor) {
    rect(x, height-a, l, a);
    x += l;
    if (aux > a)
      ordenado = false;
    aux = a;
  }

  if (ordenado) {
    JOptionPane.showMessageDialog(null, "Vetor ordenado!");
    noLoop();
  }
}
