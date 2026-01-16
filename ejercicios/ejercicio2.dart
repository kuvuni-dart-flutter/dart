import 'dart:io';

void main() {
  // ejercicio1();
  // ejercicio2()
  // ejercicio3();
  // ejercicio4();
  ejercicio5();

  String? mensaje = dameTexto("Lucas");
}

String? dameTexto(texto) {
  if (texto.length < 10) return null;
  return texto + "Adios";
}

void ejercicio1() {
  stdout.write('Ingresa el total de la cuenta (€): ');
  String? cuentaStr = stdin.readLineSync();
  double cuenta = double.tryParse(cuentaStr!) ?? 0;

  if (cuenta <= 0) {
    print('❌ Cantidad inválida');
    return;
  }

  stdout.write('Calidad del servicio (excelente/bueno/regular): ');
  String? servicio = stdin.readLineSync()?.toLowerCase();

  // TODO: Calcula el porcentaje de propina usando operador ternario
  double porcentaje = (servicio == 'excelente')
      ? 0.20
      : (servicio == 'bueno')
      ? 0.15
      : (servicio == 'regular')
      ? 0.10
      : 0.0;

  // TODO: Calcula la propina y el total
  double propina = cuenta * porcentaje;
  double total = cuenta + propina;

  // TODO: Muestra el desglose

  print("\n=== DESGLOSE ===");
  print("Subtotal: €${cuenta.toStringAsFixed(2)}");
  print("Propina (${porcentaje * 100}): €${propina.toStringAsFixed(2)}");
  print("TOTAL: €${total.toStringAsFixed(2)}");
}

void ejercicio2() {
  stdout.write('Ingresa un año: ');
  String? anioStr = stdin.readLineSync();
  int? anio = int.tryParse(anioStr ?? '0');

  if (anio == null || anio <= 0) {
    print('❌ Año inválido');
    return;
  }

  // TODO: Verifica si es bisiesto usando operadores lógicos
  bool esBisiesto = (anio % 4 == 0 && anio % 100 != 0) || (anio % 400 == 0);

  // TODO: Muestra el resultado con un mensaje claro

  print('El año $anio es bisiesto: ${(esBisiesto) ? 'SI' : "NO"} ');
  print('El año $anio es bisiesto: ${(anioBisiesto(anio)) ? 'SI' : "NO"} ');
}

void ejercicio3() {
  print('=== GESTOR DE TAREAS ===\n');

  // TODO: Crea al menos 3 tareas usando cascadas
  // Ejemplo:
  // Tarea()
  //   ..titulo = 'Estudiar Dart'
  //   ..descripcion = 'Completar ejercicios del curso'
  //   ..prioridad = 5
  //   ..mostrarInfo();

  // TODO: Crea una tarea, márcala como completada y muestra su info

  Tarea tarea1 = Tarea()
    ..titulo = "Estudiar Dart"
    ..descripcion = "Hacer ejercicios"
    ..prioridad = 5
    ..mostrarInfo();

  Tarea tarea2 = Tarea()
    ..titulo = "Disfrutar"
    ..descripcion = "Pasarlo bien"
    ..prioridad = 5
    ..mostrarInfo();

  Tarea tarea3 = Tarea()
    ..titulo = "Hacer la compra"
    ..descripcion = "Comprar fruta"
    ..prioridad = 1
    ..mostrarInfo()
    ..marcarCompletada();
}

class Tarea {
  String titulo = '';
  String descripcion = '';
  int prioridad = 1; // 1-5
  bool completada = false;

  void marcarCompletada() {
    completada = true;
    print('✅ Tarea "$titulo" marcada como completada');
  }

  void mostrarInfo() {
    String estado = completada ? '✅ Completada' : '⏳ Pendiente';
    String nivelPrioridad = (prioridad >= 4)
        ? '🔴 Alta'
        : (prioridad >= 2)
        ? '🟡 Media'
        : '🟢 Baja';

    print('\n╔════════════════════════════════════════╗');
    print('  📌 $titulo');
    print('  📄 $descripcion');
    print('  🎯 Prioridad: $nivelPrioridad ($prioridad)');
    print('  📊 Estado: $estado');
    print('╚════════════════════════════════════════╝');
  }
}

class ConversorTemperatura {
  double celsius = 0.0;

  double aFahrenheit() => (celsius * 9 / 5) + 32;
  double aKelvin() => celsius + 273.15;

  void mostrarConversiones() {
    print('\n=== CONVERSIONES DE TEMPERATURA ===');
    print('${celsius.toStringAsFixed(2)} °C');
    print('${aFahrenheit().toStringAsFixed(2)} °F');
    print('${aKelvin().toStringAsFixed(2)} K');
  }
}

class ConversorDistancia {
  double kilometros = 0.0;

  // TODO: Implementa las conversiones
  double aMetros() => kilometros * 1000;
  double aMillas() => kilometros * 0.621371; // 1 km = 0.621371 millas

  void mostrarConversiones() {
    print('\n=== CONVERSIONES DE DISTANCIA ===');
    print('${kilometros.toStringAsFixed(2)} km');
    print('${aMetros().toStringAsFixed(2)} m');
    print('${aMillas().toStringAsFixed(2)} millas');
  }
}

class ConversorPeso {
  double kilogramos = 0.0;

  // TODO: Implementa las conversiones
  double aGramos() => kilogramos * 1000;
  double aLibras() => kilogramos * 2.20462; // 1 kg = 2.20462 libras

  void mostrarConversiones() {
    // TODO: Muestra todas las conversiones
    print('\n=== CONVERSIONES DE PESO ===');
    print('${kilogramos.toStringAsFixed(2)} kg');
    print('${aGramos().toStringAsFixed(2)} g');
    print('${aLibras().toStringAsFixed(2)} lb');
  }
}

void ejercicio4() {
  print('=== CONVERSOR DE UNIDADES ===\n');
  print('1. Temperatura');
  print('2. Distancia');
  print('3. Peso');
  stdout.write('\nSelecciona una opción: ');
  String? opcion = stdin.readLineSync();

  stdout.write('Ingresa el valor: ');
  String? valorStr = stdin.readLineSync();
  double? valor = double.tryParse(valorStr ?? '0');

  if (valor == null) {
    print('❌ Valor inválido');
    return;
  }

  // TODO: Usa operador ternario o switch para llamar al conversor apropiado
  switch (opcion) {
    case '1':
      ConversorTemperatura()
        ..celsius = valor
        ..mostrarConversiones();
      break;
    case '2':
      ConversorDistancia()
        ..kilometros = valor
        ..mostrarConversiones();
      break;
    case '3':
      ConversorPeso()
        ..kilogramos = valor
        ..mostrarConversiones();
      break;
    default:
      print('🪏 Opción inválida');
  }
}

void ejercicio5() {
  print('=== ANALIZADOR DE CALIFICACIONES ===\n');

  List<double> notas = [];

  // Leer 5 calificaciones
  for (int i = 1; true; i++) {
    stdout.write('Ingresa la calificación $i (0-10): ');
   // String? notaStr = stdin.readLineSync();
    double? nota = double.tryParse(stdin.readLineSync() ?? '0');

    if (nota == null || nota < 0 || nota > 10) {
      print('❌ Calificación inválida. Usa valores entre 0 y 10.');
      continue;
    }

    notas.add(nota);
    if(notas.length == 5) break;
  }

  // TODO: Calcula el promedio
  double suma = 0;

  double notaMax = notas[0];
  double notaMin = notas[0];

  for( double nota in notas){ 
    suma+= nota;
    if(nota > notaMax) notaMax = nota;
    if(nota < notaMin) notaMin = nota;
  } 
   double promedio = suma / notas.length;
  
  // TODO: Encuentra la nota más alta y más baja
  // double notaMax = ...
  // double notaMin = ...

  // TODO: Cuenta las categorías
  int sobresalientes = 0;
  int notables = 0;
  int aprobados = 0;
  int suspensos = 0;

  for (double nota in notas) {
     if (nota >= 9) sobresalientes++;
     else if (nota >= 7) notables++;
     else if (nota >=5) aprobados++;
     else suspensos++;
      
   }

  // TODO: Muestra el reporte
  print('\n╔════════════════════════════════════════╗');
  print('           REPORTE DE CALIFICACIONES     ');
  print('╚════════════════════════════════════════╝');
   print('Calificaciones: ${notas.join(', ')}');
   print('Promedio: ${promedio.toStringAsFixed(2)}');
   print('Nota más alta: ${notaMax.toStringAsFixed(2)}');
   print('Nota más baja: ${notaMin.toStringAsFixed(2)}');
   
   print("\n Distribución:");
   print("  Sobresalientes (9-10): $sobresalientes");
   print("  Notables (7-8.99): $notables");
   print("  Aprobados (5-6.99): $aprobados");
   print("  Suspensos (0-4.99): $suspensos");

   
  // ...

  // TODO: Usa operador ternario para mostrar si aprobó
   String resultado = (promedio >= 5) ? '✅ APROBADO' : '❌ SUSPENSO';
   print("\nResultado: $resultado");
}

bool anioBisiesto(int anio) {
  bool esBisiesto = false;
  DateTime fecha = DateTime.utc(anio, 3, 0);

  DateTime fecha2 = DateTime(anio - 1, 14, 29);
  //if (fecha.day == 29) esBisiesto = true;
  if (fecha2.month == 2) esBisiesto = true;
  return esBisiesto;
}
