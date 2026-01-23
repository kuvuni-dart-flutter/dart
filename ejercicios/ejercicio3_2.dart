import 'dart:math';
import '../ejemplos/ejemplo4_listas.dart';

void main() {
  print('==============================');
  print('EJERCICIO 1: SISTEMA DE TIENDA');
  print('==============================');
  //ejercicio1Tienda();
  print('\n==============================');
  print('EJERCICIO 2: ANALIZADOR DE TEXTO');
  print('==============================');
  //ejercicio2AnalizadorTexto();
  print('\n==============================');
  print('EJERCICIO 3: JUEGO DE ADIVINANZA');
  print('==============================');
  //ejercicio3Adivinanza();
  print('\n==============================');
  print('EJERCICIO 4: SISTEMA DE RESERVAS DE CINE');
  print('==============================');
  ejercicio4ReservasCine();
}

// -----------------------------
// EJERCICIO 1: SISTEMA DE TIENDA
// -----------------------------
void ejercicio1Tienda() {
  // Mapa de productos y precios
  Map<String, double> productos = {
    'Manzana': 1.5,
    'Pan': 2.0,
    'Leche': 3.5,
    'Huevos': 4.0,
    'Queso': 5.5,
  };
  // Lista de compras
  List<String> compras = ['Manzana', 'Pan', 'Manzana', 'Leche', 'Queso'];
  // Contar productos
  Map<String, int> cantidades = {};
  for (String item in compras) {
    cantidades[item] = (cantidades[item] ?? 0) + 1;
  }
  double total = 0;
  print('\n CARRITO DE COMPRAS:');
  for (var entry in cantidades.entries) {
    if (productos.containsKey(entry.key)) {
      double precio = productos[entry.key]!;
      int cantidad = entry.value;
      double subtotal = precio * cantidad;
      total += subtotal;
      print(
        '\nProducto: ${entry.key}\n  Cantidad: $cantidad\n  Precio unitario: €${precio.toStringAsFixed(2)}\n  Subtotal: €${subtotal.toStringAsFixed(2)}',
      );
    } else {
      print('\nProducto: ${entry.key} (No disponible)');
    }
  }
  
  // Calcular descuento
  double descuento = 0;
  int porcentaje = 0;
  if (total >= 20) {
    porcentaje = 20;
  } else if (total >= 15) {
    porcentaje = 15;
  } else if (total >= 10) {
    porcentaje = 10;
  }
  descuento = total * porcentaje / 100;
  print('\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  print('RESUMEN:');
  print('Total sin descuento: €${total.toStringAsFixed(2)}');
  print('Descuento aplicado: $porcentaje% (-€${descuento.toStringAsFixed(2)})');
  print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  print('TOTAL A PAGAR: €${(total - descuento).toStringAsFixed(2)}');
}

// -----------------------------
// EJERCICIO 2: ANALIZADOR DE TEXTO
// -----------------------------
void ejercicio2AnalizadorTexto() {
  String texto = "Dart es un lenguaje de programacion moderno y versatil";

  // Contar caracteres
  int totalCaracteres = texto.length;
  // Separar palabras
  List<String> palabras = texto.split(" ");
  int totalPalabras = palabras.length;
  // Contar vocales y consonantes
  int vocales = 0, consonantes = 0;
  Map<String, int> conteoVocales = {'a': 0, 'e': 0, 'i': 0, 'o': 0, 'u': 0};

  for (String palabra in palabras) {
    for (int x = 0; x < palabra.length; x++) {
      String caracter = palabra[x].toLowerCase();
      switch (caracter) {
        case 'a' || 'á':
        case 'e' || 'é':
        case 'i' || 'í':
        case 'o' || 'ó':
        case 'u' || 'ú' || 'ü':
          conteoVocales[caracter] = (conteoVocales[caracter] ?? 0 )+ 1;
          vocales++;
          break;
        default:
          consonantes++;
      }
    }
  }

  // Palabra más larga y más corta
  String palabraLarga = palabras[0];
  String palabraCorta = palabras[0];
  for (String palabra in palabras) {
    palabraLarga = (palabraLarga.length < palabra.length)
        ? palabra
        : palabraLarga;
    palabraCorta = (palabraCorta.length > palabra.length)
        ? palabra
        : palabraCorta;
  }

  // Mostrar resultados
  print('\nTexto: "$texto"');
  print('\nESTADÍSTICAS GENERALES:');
  print('✓ Total de caracteres: $totalCaracteres');
  print('✓ Total de palabras: $totalPalabras');
  print('✓ Total de vocales: $vocales');
  print('✓ Total de consonantes: $consonantes');
  print('\nANÁLISIS DE PALABRAS:');
  print('✓ Palabra más larga: "$palabraLarga" (${palabraLarga.length} letras)');
  print(
    '✓ Palabra más corta: "$palabraCorta" (${palabraCorta.length} ${(palabraCorta.length == 1) ? 'letra' : 'letras'})',
  );
  print('\nCONTEO DE VOCALES:');
  for (var entrada in conteoVocales.entries) {
    print("${entrada.key}: ${entrada.value} veces");
  }
}

// -----------------------------
// EJERCICIO 3: JUEGO DE ADIVINANZA
// -----------------------------
void ejercicio3Adivinanza() {
  // Número aleatorio entre 1 y 50
  int numeroSecreto = Random().nextInt(50) + 1;
  // Lista de intentos simulados
  List<int> intentos = [25, 40, 35, 38, 36, 37, 43, 37, 48, 8];
  int maxIntentos = 7;
  print('\n🎯 Tienes $maxIntentos intentos');
  bool adivinado = false;
  int i = 0;
  for (i; i < intentos.length && i < maxIntentos; i++) {
    int intento = intentos[i];
    print('\nIntento #${i + 1}: $intento');
    if (intento == numeroSecreto) {
      print('¡CORRECTO! Has adivinado el número');
      adivinado = true;
      break;
    } else if (intento < numeroSecreto) {
      print('Pista: El número es más alto');
    } else {
      print('Pista: El número es más bajo');
    }
  }
  if (adivinado) {
    print('\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    if (i + 1 <= 2) {
      print('¡Excelente!');
    } else if (i + 1 <= 4) {
      print('¡Muy bien!');
    } else {
      print('¡Lo lograste!');
    }
    print('Número de intentos: ${i + 1}/$maxIntentos');
    print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  } else {
    print('\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    print('¡Se acabaron los intentos!');
    print('El número secreto era: $numeroSecreto');
    print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  }
}

// -----------------------------
// EJERCICIO 4: SISTEMA DE RESERVAS DE CINE
// -----------------------------
void ejercicio4ReservasCine() {
  // Estado inicial de asientos
  List<List<String>> asientos = [
    ['L', 'L', 'O', 'L', 'L', 'L', 'O', 'L'],
    ['L', 'L', 'L', 'L', 'L', 'L', 'L', 'L'],
    ['O', 'O', 'L', 'L', 'L', 'L', 'L', 'L'],
    ['L', 'L', 'L', 'O', 'O', 'L', 'L', 'L'],
    ['L', 'L', 'L', 'L', 'L', 'L', 'L', 'L'],
  ];

  int mostrarMapa(List<List<String>> mapa, String titulo) {
    int ocupados = 0;
    print('\n$titulo:');
    print("     A  B  C  D  E  F  G  H");
    for (int i = 0; i < mapa.length; i++) {
      String fila = " ${i + 1} "; // Número de fila
      for (int j = 0; j < mapa[i].length; j++) {
        if (mapa[i][j] == 'O'){
          fila += '[O]';
          ocupados++;
        }
        else
          fila += '[L]';
      }
      print(fila);
    }
    return ocupados;
  }
  
 int ocupados = mostrarMapa(asientos, "MAPA DE ASIENTOS INICIAL");

  List<String> letras = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];
  List<List<String>> reservas = [
    ['1', 'A'],
    ['1', 'B'],
    ['3', 'D'],
    ['5', 'H'],
    ['2', 'C'],
  ];
  int exitosas = 0, fallidas = 0;

  print('\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  print('\nPROCESANDO RESERVAS:');
  for (var reserva in reservas) {
    int fila = int.parse(reserva[0]) - 1;
    int col = letras.indexOf(reserva[1]);
    if (asientos[fila][col] == 'L') {
      asientos[fila][col] = 'O';
      print('Reserva exitosa: Fila ${fila + 1}, Asiento ${letras[col]}');
      exitosas++;
    } else {
      print(
        'Reserva fallida: Fila ${fila + 1}, Asiento ${letras[col]} (Ocupado)',
      );
      fallidas++;
    }
  }
  print('\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');

  ocupados = mostrarMapa(asientos, "MAPA DE ASIENTOS FINAL");
 
  print('\nRESUMEN:');
  print('Reservas exitosas: $exitosas');
  print('Reservas fallidas: $fallidas');
  print('Total de asientos ocupados: $ocupados/40');
}
