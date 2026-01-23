import 'dart:io';

void main() {
  int? orden;
  do {
    stdout.write("Inserte el orden para pintar flecha izquierda: ");
    orden = int.tryParse(stdin.readLineSync()!);
    if (orden == null || orden <= 0)
      print("Inserte un valor válido");
    else
      pintarFlecha(orden);
  } while (orden is! int);
}

void pintarFlecha(int orden) {
  stdout.writeln();
  
  //Parte superior
  for (int x = 1; x < orden; x++) {
    pintarCaracter(" ", orden * 2  - x * 2);
    pintarCaracter("x", x * 2 - 1);
    stdout.write("\n");
  }
  //Parte central
  pintarCaracter("x", orden * 2 - 1);
  pintarCaracter("=", orden);
  stdout.write("\n");

  //Parte inferior

  for (int x = orden - 1; x >= 1 ; x--) {
    pintarCaracter(" ", (orden - x) * 2);
    pintarCaracter("x", x * 2 - 1);
    stdout.write("\n");
  }
  stdout.writeln();
}

void pintarCaracter(String caracter, int cantidad) {
  for (int i = 0; i < cantidad; i++) stdout.write(caracter);
}
