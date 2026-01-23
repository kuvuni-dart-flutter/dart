import 'dart:io';

void main() {
  int? orden;
  do {
    stdout.write("Inserte el orden para pintar un árbol de Navidad: ");
    orden = int.tryParse(stdin.readLineSync()!);
    if (orden == null || orden <= 0)
      print("Inserte un valor válido");
    else
      pintarArbol(orden);
  } while (orden is! int);

}

void pintarArbol(int orden) {
  stdout.writeln();
  for (int x = 1; x <= orden; x++) {
    pintarCaracter(" ", orden - x);
    pintarCaracter("x", x * 2 - 1);
    stdout.write("\n");
  }
  pintarCaracter(" ", orden - 2);
  pintarCaracter("|", 3);
  stdout.writeln("\n");

}

void pintarCaracter(String caracter, int cantidad) {
  for (int i = 0; i < cantidad; i++) stdout.write(caracter);
}


