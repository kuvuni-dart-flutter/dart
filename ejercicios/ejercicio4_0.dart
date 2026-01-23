import 'dart:io';

void main() {
  //Ejercicio 1
  // ejercicio4_1();
  //ejercicio4_2();
 // ejercicio4_3();
 // ejercicio4_4();
  ejercicio4_5();
}

void ejercicio4_1() {
  List<String> tareas = [];
  bool continuar = true;

  while (continuar) {
    print('\n╔═══════════════════════════════════════╗');
    print('║     GESTOR DE TAREAS                  ║');
    print('╚═══════════════════════════════════════╝');
    print('1. ➕ Agregar tarea');
    print('2. ❌ Eliminar tarea por nombre');
    print('3. 🗑️  Eliminar tarea por posición');
    print('4. 🔍 Buscar tarea');
    print('5. 📋 Mostrar todas las tareas');
    print('6. 🧹 Limpiar todas las tareas');
    print('0. 🚪 Salir');

    stdout.write('\nSelecciona una opción: ');
    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case '1':
        // TODO: Agregar tarea
        // - Lee el nombre de la tarea
        stdout.write("\nIngresa el nombre de la tarea: ");
        String nuevaTarea = stdin.readLineSync() ?? "";

        // - Usa add() para agregarla
        if (nuevaTarea != "") {
          tareas.add(nuevaTarea);
          print('Tarea "$nuevaTarea" agregada');
        } else
          print("Nombre de tarea inválido");
        // - Muestra confirmación
        break;

      case '2':
        // TODO: Eliminar por nombre
        // - Lee el nombre de la tarea
        stdout.write('\nIngresa el nombre de la tarea a eliminar: ');
        String nombreEliminar = stdin.readLineSync()!;
        // - Usa contains() para verificar si existe
        if (nombreEliminar.isNotEmpty && tareas.remove(nombreEliminar))
          print("Tarea: $nombreEliminar eliminada.");
        else
          print("Tarea no encontrada");
        // - Usa remove() para eliminarla
        break;

      case '3':
        // TODO: Eliminar por posición
        if (tareas.isEmpty) {
          print("No hay tareas");
          break;
        }
        // - Muestra las tareas con índices
        for (int i = 0; i < tareas.length; i++) print("${i + 1}. ${tareas[i]}");
        // - Lee la posición
        stdout.write("\nIngresa el número de la tarea a eliminar:");
        String posStr = stdin.readLineSync() ?? '0';
        int posicion = int.tryParse(posStr) ?? 0;
        // - Valida que esté en rango
        if (posicion >= 1 && posicion <= tareas.length)
          print('Tarea ${tareas.removeAt(posicion-1)} eliminada');
        // - Usa removeAt()
        else
          print("Posición inválida");
        break;

      case '4':
        // TODO: Buscar tarea
        // - Lee el nombre
        stdout.write('\nIngresa el nombre de la tarea a buscar: ');
        String buscar = stdin.readLineSync()!;

        // - Usa contains() e indexOf()
        if (buscar.isNotEmpty && tareas.contains(buscar)) {
          print(
            "Encontrada: $buscar en posicion ${tareas.indexOf(buscar) + 1}",
          );
        } else
          print("Tarea no encontrada");
        // - Muestra si existe y su posición
        break;

      case '5':
        // TODO: Mostrar tareas
        // - Verifica si la lista está vacía con isEmpty
        if (tareas.isEmpty)
          print("No hay tareas");
        else {
          print("\n TAREAS (${tareas.length})");
          // - Recorre con for o forEach
          tareas.forEach((tarea) {
            // - Muestra índice y tarea
            int indice = tareas.indexOf(tarea) + 1;
            print('Índice: $indice. Tarea:  $tarea');
          });
        }
        break;

      case '6':
        // TODO: Limpiar tareas
        if (tareas.isNotEmpty) {
          print("Se eliminaron ${tareas.length} tareas");
          tareas.clear();
        } else
          print("La lista ya está vacía");
        // - Usa clear()
        // - Muestra confirmación
        break;

      case '0':
        print('\n👋 ¡Hasta luego!');
        continuar = false;
        break;

      default:
        print('❌ Opción inválida');
    }
  }
}

void ejercicio4_2() {
  print('╔═══════════════════════════════════════╗');
  print('║  ANÁLISIS DE CALIFICACIONES           ║');
  print('╚═══════════════════════════════════════╝\n');

  List<double> calificaciones = [];

  // Leer 10 calificaciones
  for (int i = 1; i <= 10; i++) {
    stdout.write('Calificación $i (0-10): ');
    String? input = stdin.readLineSync();
    double? nota = double.tryParse(input ?? '0');

    if (nota == null || nota < 0 || nota > 10) {
      print('❌ Calificación inválida');
      i--;
      continue;
    }

    calificaciones.add(nota);
  }

  // TODO: Calcular promedio
  // Usa reduce() o fold()
  double promedio =
      calificaciones.reduce((a, b) => a + b) / calificaciones.length;

  // TODO: Encontrar máxima y mínima
  double maxima = calificaciones.reduce((a, b) => a > b ? a : b);
  double minima = calificaciones.reduce((a, b) => a < b ? a : b);

  // TODO: Contar aprobadas
  var aprobadas = calificaciones.where((nota) => nota >= 5);
  int cantidadAprobadas = aprobadas.length;

  // TODO: Contar sobresalientes
  var sobresalientes = calificaciones.where((nota) => nota >= 9);

  // TODO: Ordenar de menor a mayor
  var ordenadas = List<double>.from(calificaciones);
  ordenadas.sort();

  // TODO: Ordenar de mayor a menor
  var descendente = List<double>.from(calificaciones);
  descendente.sort((a, b) => b.compareTo(a));

  // TODO: Mostrar resultados
  print('\n═══ RESULTADOS ═══');
  print('Calificaciones: $calificaciones');
  print('Promedio: ${promedio.toStringAsFixed(2)}');
  print('Máxima: $maxima');
  print('Mínima: $minima');
  print('Aprobadas: $cantidadAprobadas');
  print('Sobresalientes: ${sobresalientes.length}');
  print('Ordenadas (↑): $ordenadas');
  print('Ordenadas (↓): $descendente');
}

void ejercicio4_3() {
  print('╔═══════════════════════════════════════╗');
  print('║  MANIPULADOR DE LISTAS                ║');
  print('╚═══════════════════════════════════════╝\n');

  // Generar lista de 1 a 20
  var numeros = List<int>.generate(20, (index) => index + 1);
  print('Lista original: $numeros\n');

  // TODO: Duplicar cada número con map()
  print('═══ MAP (transformar) ═══');
  var duplicados = numeros.map((n) => n * 2).toList();
  print('Duplicados: $duplicados');

  // TODO: Elevar al cuadrado
  var cuadrados = numeros.map((n) => n * n).toList();
  print('Cuadrados: $cuadrados');

  // TODO: Convertir a negativos
  var negativos = numeros.map((n) => -n).toList();
  print('Negativos: $negativos');

  // TODO: Filtrar pares con where()
  print('\n═══ WHERE (filtrar) ═══');
  var pares = numeros.where((n) => n % 2 == 0).toList();
  print('Pares: $pares');

  // TODO: Filtrar mayores a 10
  var mayores = numeros.where((n) => n > 10).toList();
  print('Mayores a 10: $mayores');

  // TODO: Filtrar múltiplos de 3
  var multiplos3 = numeros.where((n) => n % 3 == 0).toList();
  print('Múltiplos de 3: $multiplos3');

  // TODO: Verificar con any() y every()
  print('\n═══ ANY y EVERY (verificar) ═══');
  bool hayMayorA50 = numeros.any((n) => n > 50);
  bool todosMenoresA100 = numeros.every((n) => n < 100);
  print('¿Hay alguno mayor a 50? $hayMayorA50');
  print('¿Todos son menores a 100? $todosMenoresA100');

  // TODO: Expandir elementos
  print('\n═══ EXPAND (expandir) ═══');
  var expandido = numeros.take(5).expand((n) => [n, n * 10, n * 100]).toList();
  print('Expandido (primeros 5): $expandido');

  // TODO: Operaciones en cadena
  print('\n═══ OPERACIONES EN CADENA ═══');
  var resultado = numeros
      .where((n) => n % 2 == 0) // Solo pares
      .map((n) => n * n) // Elevar al cuadrado
      .where((n) => n < 200) // Menores a 200
      .toList();
  print('Resultado: $resultado');
}

//********************** EJERCICIO 4 ***************/
class Inventario {
  List<String> productos = [];
  List<int> cantidades = [];
  List<double> precios = [];

  void agregarProducto(String nombre, int cantidad, double precio) {
    // TODO: Añadir a las tres listas
    productos.add(nombre);
    cantidades.add(cantidad);
    precios.add(precio);
    print('✅ Producto agregado');
  }

  int buscarProducto(String nombre) {
    // TODO: Usa indexOf() para buscar
    return productos.indexOf(nombre);
  }

  void actualizarCantidad(String nombre, int nuevaCantidad) {
    // TODO: Busca el índice y actualiza
    int index = buscarProducto(nombre);
    if (index != -1) {
      cantidades[index] = nuevaCantidad;
      print('✅ Cantidad actualizada');
    } else {
      print('❌ Producto no encontrado');
    }
  }

  void eliminarProducto(String nombre) {
    // TODO: Elimina de las 3 listas sincronizadamente
    int index = buscarProducto(nombre);
    if (index != -1) {
      productos.removeAt(index);
      cantidades.removeAt(index);
      precios.removeAt(index);
      print('✅ Producto eliminado');
    } else {
      print('❌ Producto no encontrado');
    }
  }

  void mostrarInventario() {
    // TODO: Muestra todos los productos con formato
    if (productos.isEmpty) {
      print('📦 Inventario vacío');
      return;
    }

    print('\n╔════════════════════════════════════════════════╗');
    print('║              INVENTARIO COMPLETO               ║');
    print('╚════════════════════════════════════════════════╝');

    for (int i = 0; i < productos.length; i++) {
      print('${i + 1}. ${productos[i]}');
      print('   Cantidad: ${cantidades[i]} unidades');
      print('   Precio: €${precios[i].toStringAsFixed(2)}');
      print('   Valor: €${(cantidades[i] * precios[i]).toStringAsFixed(2)}');
      print('');
    }
  }

  double calcularValorTotal() {
    // TODO: Suma el valor de todos los productos
    double total = 0;
    for (int i = 0; i < productos.length; i++) {
      total += cantidades[i] * precios[i];
    }
    return total;
  }

  List<String> obtenerStockBajo() {
    // TODO: Encuentra productos con cantidad < 5
    List<String> stockBajo = [];
    for (int i = 0; i < productos.length; i++) {
      if (cantidades[i] < 5) {
        stockBajo.add(productos[i]);
      }
    }
    return stockBajo;
  }

  void ordenarPorPrecio() {
    List<double> preciosOrdenados = List<double>.from(precios)..sort();
    List<int> cantidadesOrdenadas = List<int>.from(cantidades);
    List<String> productosOrdenados = List<String>.from(productos);
    preciosOrdenados.forEach((item) {
      int indiceOriginal = precios.indexOf(item);
      int indiceNuevo = preciosOrdenados.indexOf(item);
      productosOrdenados[indiceNuevo] = productos[indiceOriginal];
      cantidadesOrdenadas[indiceNuevo] = cantidades[indiceOriginal];
    });
    precios = preciosOrdenados;
    cantidades = cantidadesOrdenadas;
    productos = productosOrdenados;
  }

  void ordenarProductos2()
  {

    for(int i=0; i<precios.length;i++)
    {
      for(int a=0; a<precios.length;a++)
      {
        if(precios[a]>precios[i])
        {
          cambiarPos(a, i);
        }
      }
    }

  }
  void cambiarPos(int indiceNuevaPos,int indiceAntiguaPos)
  {
    double precioAntiguo=precios[indiceAntiguaPos];
    precios[indiceAntiguaPos]=precios[indiceNuevaPos];
    precios[indiceNuevaPos]=precioAntiguo;

    int cantidadeAntiguo=cantidades[indiceAntiguaPos];
    cantidades[indiceAntiguaPos]=cantidades[indiceNuevaPos];
    cantidades[indiceNuevaPos]=cantidadeAntiguo;

    String productoAntiguo=productos[indiceAntiguaPos];
    productos[indiceAntiguaPos]=productos[indiceNuevaPos];
    productos[indiceNuevaPos]=productoAntiguo;

  }
  

  
}

void ejercicio4_4() {
  var inventario = Inventario();

  // Datos de prueba
  inventario.agregarProducto('Laptop', 10, 899.99);
  inventario.agregarProducto('Mouse', 3, 25.50);
  inventario.agregarProducto('Teclado', 15, 49.99);
  inventario.agregarProducto('CPU', 5, 25.50);
  inventario.agregarProducto('Monitor', 2, 199.99);

  // TODO: Implementa el menú interactivo
  inventario.mostrarInventario();

  print('\n═══ VALOR TOTAL ═══');
  print('Total: €${inventario.calcularValorTotal().toStringAsFixed(2)}');

  print('\n═══ STOCK BAJO ═══');
  var stockBajo = inventario.obtenerStockBajo();
  if (stockBajo.isEmpty) {
    print('✅ No hay productos con stock bajo');
  } else {
    print('⚠️ Productos con stock bajo: $stockBajo');
  }

  print('Ordenar productos por precio');
  //inventario.ordenarPorPrecio();
  inventario.ordenarProductos2();
  inventario.mostrarInventario();



  /*
  **Desafío adicional:**
  - Ordena los productos por precio (necesitarás ordenar las 3 listas sincronizadamente)
  - Implementa búsqueda case-insensitive
  - Añade categorías a los productos
  */
}

void ejercicio4_5() {
  print('╔═══════════════════════════════════════╗');
  print('║     PROCESADOR DE TEXTO               ║');
  print('╚═══════════════════════════════════════╝\n');

  stdout.write('Ingresa un texto: ');
  // String? texto = stdin.readLineSync();
   String? texto = "   ¡Hola, hola mundo! Esto es un texto de prueba. Por cierto,  vivo en Getafe (España) . ! Tiene varias palabras: programación, Dart, Flutter, y más.    ";

  if (texto == null || texto.isEmpty) {
    print('❌ No ingresaste texto');
    return;
  }

  // Separar en palabras
  List<String> palabras = texto.trim().split(' ');

 print(palabras);

  //Palabras sin espacios o símbolos sueltos
  List<String> palabrasSinEspacios = palabras
      .where(
        (palabra) => (palabra.isNotEmpty && !('.;:¡!¿?=/&%\$').contains(palabra)),
      )
      .toList();

  print(palabrasSinEspacios);
  
  List<String> palabrasSinSignos = palabrasSinEspacios.map((palabra) {
    return palabra.replaceAll(RegExp(r"[^a-zA-Z0-9ñÑáíóúÁÉÍÓÚ]"), "").toLowerCase();
  }).toList();

  print(palabrasSinSignos);

  palabras = palabrasSinSignos;
  print(palabras);

  print('Total de palabras: ${palabras.length}');

  // TODO: Palabra más larga
  String masLarga = palabras.reduce((a, b) => a.length > b.length ? a : b);
  print('Palabra más larga: $masLarga (${masLarga.length} letras)');

  // TODO: Palabra más corta
  String masCorta = palabras.reduce((a, b) => a.length < b.length ? a : b);
  print('Palabra más corta: $masCorta (${masCorta.length} letras)');

  // TODO: Eliminar duplicados
  var sinDuplicados = palabras.toSet().toList();
  print('Sin duplicados: ${sinDuplicados.length} palabras únicas');

  // TODO: Ordenar alfabéticamente
  var ordenadas = List<String>.from(palabras)..sort();
  print('Ordenadas: $ordenadas');

  // TODO: Filtrar palabras largas (> 5 letras)
  var largas = palabras.where((p) => p.length > 5).toList();
  print('Palabras de más de 5 letras: $largas');

  // TODO: Contar palabras que empiezan con vocal
  var conVocal = palabras.where((palabra) {
    var primeraLetra = palabra[0];
    return 'aeiouáéíóú'.contains(primeraLetra);
  });
  print('Palabras que empiezan con vocal: ${conVocal.length} Palabras: $conVocal');

  // TODO: Invertir orden
  var invertidas = palabras.reversed.toList();
  print('Invertidas: $invertidas');

  // TODO: Unir de nuevo
  var textoInvertido = invertidas.join(' ');
  print('Texto invertido: $textoInvertido');

  // TODO: Operaciones en cadena
  print('\n═══ TRANSFORMACIÓN COMPLEJA ═══');
  var resultado = palabras
      .where((p) => p.length > 3) // Más de 3 letras
      .map((p) => p.toUpperCase()) // A mayúsculas
      .toList()..sort();
  //
  print('Resultado: $resultado');
}
