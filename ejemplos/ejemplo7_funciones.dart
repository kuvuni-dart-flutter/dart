//Función simple sin parámetro ni retorno

import 'dart:math';

dartSaludar() {
  print("Hola desde una función");
  print("Soy ${dartSaludar.runtimeType}");
  return "Hola";
}

//Función con parámetros y sin retorno

void mostrarSuma(num a, num b) {
  print("La suma de $a y $b es ${a + b}");
}

//Función con retorno

double areaCirculo(double radio) {
  return pi * radio * radio;
}

//Funciones con parámetros opcionales posicionales []
void saludar([String nombre = 'amigo']) {
  print("Hola $nombre!");
}

void dibujarRectangulo(int ancho, [int alto = 10, String color = 'azul']) {
  print("Rectángulo: $ancho * $alto, color: $color");
}

//Funciones con parametros nombrados

void mostrarDatos({
  required String nombre,
  int edad = 0,
  required String apellidos,
  String ciudad = "Desconocido",
}) {
  print("Nombre: $nombre, edad: $edad, ciudad: $ciudad");
}

//Función flecha. Sintaxis corta para una sola expresión.

int cuadrado(int x) => x * x; //Implicito en return

// Función anónima (lambda). Para más una expresión

Function triple = (int numero){
 print("Función anónima");
 return numero * 3;
};

int triple2 (int numero) {
  return numero*3;
}

Function triple3 = (int n) => n*3;

//Función como parámetro de otra función

void aplicarFuncion(int valor, int Function(int) funcion ) {
  print("Resultado: ${funcion(valor)}");
}

//Función que retorna otra función (closure - clausura). 
Function multiplicador(int n){
  return (int x) {
     return x * n;
  };
 
  // return (int x) => x * n
}

//Función recursiva. Función que se llama a si misma.

int factorial(int n){
  if (n <= 1) return 1;
  return n * factorial(n-1);
}

//Función anidada
void funcionExterna(){
  void interna() {
    print("Soy una función interna");
  }
  interna();
}

//Función dinámica. Puede retornar divertos tipos.

dynamic sumaDinamica(a, b) => a + b;

//Funciones de orden superior

List<int> operarLista(List<int> lista, int Function(int) operacion){
  return lista.map(operacion).toList();
}


void main() {

  print(operarLista([1,2,3], cuadrado)); //[1,4,9]
  print(operarLista([5,10,15], (x)=>x + 3)); //[8, 13, 18]
   
  print(sumaDinamica(2, 3)); // 5
  print(sumaDinamica(2.4, 3)); //5.4
  print(sumaDinamica("Hola ", "amigo")); //Hola amigo
  print(sumaDinamica([2,3,4], [5, 6, 7])); // [2, 3, 4, 5, 6, 7]
  print(sumaDinamica("Hola", 3.toString()));
  funcionExterna();
  print("Factorial de 5 es ${factorial(5)}");  // 120
  print("Factorial de 0 es ${factorial(0)}");  
  var porDos = multiplicador(2);
  print(porDos(20)); // 40
  var porCinco = multiplicador(5);
  int res = porCinco(6); // 30
  print("El valor de 5 * 6 es $res");

  print("Multiplicar 5 * 20: ${multiplicador(5)(20)}"); //100. Invocación directa


  aplicarFuncion(10, cuadrado);
  aplicarFuncion(1000, triple2);
  print("El triple de 300 es ${triple(300)} ");
  /*
  print("El cuadrado de 20 es ${cuadrado(20)}");
  mostrarDatos(nombre: "María", apellidos: "López López");
  mostrarDatos(edad: 19, nombre: "Pepa", apellidos: "Glez López");
  mostrarDatos(ciudad: "Aranjuez", nombre: "Luis", edad: 23, apellidos: "Garcia Garcia");


  dibujarRectangulo(5);
  dibujarRectangulo(20, 30);
  dibujarRectangulo(30, 45, "verde");
  dartSaludar();
  mostrarSuma(5, 7);
  print("El area de un circulo con radio 20 es ${areaCirculo(20.0).toStringAsFixed(3)}");
  saludar();
  saludar("Pepe");*/
}
