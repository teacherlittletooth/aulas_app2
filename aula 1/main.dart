//Comentário de linha
/*
Comentário de bloco
*/

// Função elementar
void main() {
  //print, envia um texto para o console
  print("Hello world!");
  print("------ APPII - Aula 1 -----");
  
  //var = declaração de variável genérica
  var nome = "Paulo";
  var sobrenome = "Donini";
  
  //Interpolação de textos (String)
  print("$nome $sobrenome");
  
  //Constantes: const e final
  const double num_pi = 3.1415;
  final DateTime data = DateTime.now();
  
  print("PI = $num_pi");
  print("Data = $data");
  
  //Uso do tipo de dado dynamic
  dynamic valor = "Um texto...";
  print(valor is String);
  
  valor = 10;
  print(valor is int);
  
  //Chamando função externa
  print("Área do retângulo 5.6 x 7.4:");
  print(areaRetangulo(5.6, 7.4));
  
  print("Área do trapézio:");
  print(areaTrapezio(a: 3.9, bMaior: 4.3, bMenor:5.7));
}


//Funções
double areaRetangulo(double b, double a) {
  return b * a;
}

double areaTrapezio({
  double bMenor = 0,
  double bMaior = 0,
  double a = 0
  }) {
  return ((bMaior + bMenor) * a) / 2;
}
