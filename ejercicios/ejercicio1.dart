///* Ejercicio 1.1
/*void main(){
    String saludo = '''
═══════════════════════════════════════
   ¡Bienvenido al Curso de Dart!
═══════════════════════════════════════
Este es un lenguaje versátil y moderno.
Prepárate para aprender programación.
''';

    print(saludo);
}
*/

// Ejercicio 1.2

void main(List<String> args) {
  if (args.length == 2) {
    print("Hola, mi nombre es ${args[0]}");
    print("Tengo ${args[1]} años");
    print("Soy estudiante de Dart en el curso de Getafe");
  }
  ejercicio1_3();
  // Ejercicio 2.1

  print('=== Cálculo de Precios ===');
  double precioBase = 111.13;
  double iva = 21;

  print('Precio base: €$precioBase');
  print('IVA ($iva%): €${(precioBase * iva / 100).toStringAsFixed(2)}');
  var precioFin = calcularPrecioConIVA(550, 21).toStringAsFixed(3);
  print("PrecioFin = $precioFin, Tipo: ${precioFin.runtimeType} ");
  print(
    'Precio final: €${calcularPrecioConIVA(precioBase, iva).toStringAsFixed(2)}',
  );

  ejercicio2_2();
  ejercicio2_3();
  ejercicio2_4();
    ejercicio2_5();
    ejercicio3_1();
}

void ejercicio1_3() {
  String nombreProducto = "MacBook Pro";
  double precio = 2499.99;
  int cantidad = 3;
  bool disponible = true;

  print("Producto: $nombreProducto");
  print("Precio: €$precio");
  print("Stock: $cantidad unidades");
  print("Disponible: $disponible");
}

double calcularPrecioConIVA(double precioBase, double ivaPorcentaje) {
  return precioBase + (precioBase * ivaPorcentaje / 100);
}

void ejercicio2_2() {
  List<double> notas = [8.5, 7.2, 9.1, 6.8, 8.9];
  notas.add(8.3);
  print("Notas: $notas");
  print(notas[2]);
  int aprobados = 0;
  double sumaNotas = 0.0;
  for (double nota in notas) {
    sumaNotas += nota;
    if (nota >= 7.0) aprobados++;
    print("Número de aprobados: $aprobados");
  }

  print("Promedio de notas: ${(sumaNotas / notas.length).toStringAsFixed(2)}");
}

void ejercicio2_3() {
  Map<String, double> libreria = {
    "Dune": 15.99,
    "1984": 12.50,
    "El Principito": 10.00,
    "El Hobbit": 14.25,
    "Cien Años de Soledad": 18.75,
  };
  libreria["Fahrenheit 451"] = 11.30;

  print("=== Librería ===");
  print("Libros: ${libreria.keys}");
  print("Precios: ${libreria.values}");
  var clave = libreria.values;
  print(clave.runtimeType) ;
  print("El mapa: $libreria");
  double valorTotal = 0.0;
  for (var libro in libreria.keys) {
    print("El precio de '$libro' es €${libreria[libro]}");
    valorTotal += libreria[libro] ?? 0;
  }
    
  print("Precio de '1984': €${libreria["1984"]}");
  print("Valor total de la librería: ${valorTotal}€");
}

void ejercicio2_4() {
  Set<String> lenguajes = {"Dart", "Python", "JavaScript", "C#", "Java"};
    lenguajes.add("Go");
    lenguajes.add("Dart");

    print("Lenguajes de programación: $lenguajes ${lenguajes.length}");
    print("¿Dominas Dart? ${lenguajes.contains("Dart")}"); 
    print("¿Dominas C++? ${lenguajes.contains("C++")}"); 

    print("Lenguajes actualizados: $lenguajes");
}  

void ejercicio2_5() {
  String proyectoDescripcion = '''
    ╔═════════════════════════════════════════════╗
    ║      GESTOR DE TAREAS - PROYECTO DART       ║
    ╚═════════════════════════════════════════════╝
    
    DESCRIPCIÓN:
    Aplicación de consola para gestionar tareas diarias
    
    OBJETIVOS:
    • Crear, eliminar y actualizar tareas
    • Marcar tareas como completadas
    • Generar reportes de productividad
    
    TECNOLOGÍA: Dart + Flutter
  ''';
  
  print(proyectoDescripcion);
}

void ejercicio3_1() {
 const int puerto = 8080; // Configuración fija en compilación
  const String version = '1.0.0';
  const String autor = 'Tu Nombre';
  
  final DateTime fechaInicio = DateTime.now(); // Evaluado al ejecutarse
  final String hostname = _obtenerHostname(); // Se ejecuta al correr
  
  print('=== CONFIGURACIÓN DE APLICACIÓN ===');
  print('Puerto: $puerto');
  print('Versión: $version');
  print('Autor: $autor');
  print('Inicio: $fechaInicio');
  print('Host: $hostname');
}

String _obtenerHostname() => 'localhost';

String obtenerHostname() {
    return 'localhost';
}

