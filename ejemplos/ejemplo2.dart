import 'dart:io';

void main() {

  //Operadores aritméticos
  int a = 10;
  int b = 3;

  print('Suma: ${a + b}'); // 13
  print('Resta: ${a - b}'); // 7
  print('Multiplicación: ${a * b}'); // 30
  print('División: ${a / b}'); // 3.3333...
  print('División entera: ${a ~/ b}'); // 3
  print('Módulo: ${a % b}'); // 1

  //Operadores de asignación
  int c = 5;
  c += 2; // c = c + 2
  print('Asignación suma: $c'); // 7
  c -= 4; // c = c - 4
  print('Asignación resta: $c'); // 3
  c *= 3; // c = c * 3
  print('Asignación multiplicación: $c'); // 21
  double d = 10.0;
  d /= 2; // d1 = d1 / 2
  print('Asignación división: $d'); // 5.0
  c ~/= 2; // c = c ~/ 2
  print('Asignación división entera: $c'); // 10
  c %= 3;
  print('Asignación módulo: $c'); // 1
  String? texto;
  texto ??= 'Valor por defecto'; // Asignación si es nulo
  print('Asignación nula: $texto'); // Valor por defecto
  texto ??= 'Otro valor';
  print('Asignación: $texto'); // Devuelve Valor por defecto

  //Incremento y decremento
  int num = 10;
  num++; // Incremento
  print('Incremento: $num'); // 11
  num--; // Decremento
  print('Decremento: $num'); // 10

  int e = 5;
  int f = ++e; // Pre-incremento
  print(f);
  int g = e++; // Post-incremento
  print(g);

  //Operadores de comparación
  int x = 10;
  int y = 20;

  print('Igualdad: ${x == y}'); // false
  print('Desigualdad: ${x != y}'); // true
  print('Mayor que: ${x > y}'); // false
  print('Menor que: ${x < y}'); // true
  print('Mayor o igual que: ${x >= y}'); // false
  print('Menor o igual que: ${x <= y}'); // true

  //Operadores lógicos
  bool p = true;
  bool q = false;

  print('AND lógico: ${p && q}'); // false
  print('OR lógico: ${p || q}'); // true
  print('NOT lógico: ${!p}'); // false

  //Operadores de cascada

  //Sin cascada
  Persona persona1 = Persona();
  persona1.nombre = 'Ana';
  persona1.edad = 25;
  persona1.mostrarInfo();

  //Con cascada

  //La clase Persona debe estar definida fuera del main
  Persona persona = Persona()
    ..nombre = 'Carlos'
    ..edad = 28
    ..mostrarInfo();

  //Operador condicional (ternario)
  int edad = 18;
  String mensaje = (edad >= 18) ? 'Adulto' : 'Menor de edad';
  print('Mensaje: $mensaje'); // Adulto

  //Operador de acceso seguro
  String? nombre; // Puede ser null
  String nombreFinal =
      nombre ?? 'Invitado'; // Si nombre es null, usa 'Invitado'
  print('Nombre final: $nombreFinal'); // Invitado

  //Operador de tipo
  var valor = 42;
  if (valor is int) {
    print('Es un entero');
  } else {
    print('No es un entero');
  }
  if (valor is! String) {
    print('No es una cadena de texto');
  } else {
    print('Es una cadena de texto');
  }

  //Como insertar datos por consola
  //import 'dart:io'; al inicio del archivo
  stdout.writeln('=== Entrada por consola ===');
  stdout.write('Ingresa tu nombre: ');
  //String? nombreUsuario = stdin.readLineSync();
  String nombreUsuario = stdin.readLineSync() ?? 'Usuario'; // Valor por defecto si es null 
  print('Hola, $nombreUsuario!');

  //Ejemplo de consola con dos números y que imprima la suma
  stdout.write('Ingresa el primer número: '); 
  String? input1 = stdin.readLineSync();
  stdout.write('Ingresa el segundo número: ');
  String? input2 = stdin.readLineSync();
  double num1 = double.tryParse(input1 ?? '') ?? 0.0; // Convierte a double, si falla usa 0.0
  double num2 = double.tryParse(input2 ?? '') ?? 0.0; // Convierte a double, si falla usa 0.0
  double suma = num1 + num2;
  print('La suma de $num1 y $num2 es: $suma');

  /* DIFERENCIA entre PARSEAR y CASTING:
   * 
   * PARSEAR (parse):
   * - Convierte una REPRESENTACIÓN de un tipo a otro tipo
   * - Ejemplo: String '123' -> int 123 (analiza el texto y crea un número)
   * - Usa métodos como: int.parse(), double.parse(), int.tryParse()
   * - Puede FALLAR si el formato es incorrecto (ej: int.parse('abc') lanza excepción)
   * - Requiere procesamiento/análisis de la cadena
   * 
   * CASTING (as):
   * - Trata un objeto como si fuera de otro tipo (sin conversión real)
   * - Ejemplo: dynamic x = 123; int y = x as int;
   * - El objeto YA ES de ese tipo, solo le decimos al compilador que lo trate así
   * - Puede FALLAR si el objeto no es realmente de ese tipo (lanza excepción en runtime)
   * - No hay procesamiento, solo reinterpretación de tipo
   * 
   * EJEMPLO:
   * String texto = '42';
   * int numero = int.parse(texto);     // ✅ PARSEAR: convierte String a int
   * 
   * dynamic valor = 42;
   * int numero = valor as int;         // ✅ CASTING: trata dynamic como int
   * 
   * dynamic texto = '42';
   * int numero = texto as int;         // ❌ ERROR: texto es String, no int
   * int numero = int.parse(texto);     // ✅ CORRECTO: parsea el String
   */
   
  
}

class Persona {
  String nombre = "";
  int edad = 0;

  void mostrarInfo() {
    print('Nombre: $nombre, Edad: $edad');
  }
}
