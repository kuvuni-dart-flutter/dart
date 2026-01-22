# Ejercicios de Nivel Medio - Listas en Dart

---

## Ejercicio 1: Gestor de Lista de Tareas 📝

Crea un gestor de tareas utilizando listas y sus métodos principales.

**Requisitos:**
- Crea una lista de tareas (strings)
- Implementa las siguientes funciones:
  - Agregar una tarea
  - Eliminar una tarea por nombre
  - Eliminar una tarea por posición
  - Buscar si existe una tarea
  - Mostrar todas las tareas
  - Mostrar cuántas tareas hay
  - Limpiar todas las tareas
- Usa un menú interactivo con bucle

**Código base:**
```dart
import 'dart:io';

void main() {
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
        // - Usa add() para agregarla
        // - Muestra confirmación
        break;
        
      case '2':
        // TODO: Eliminar por nombre
        // - Lee el nombre de la tarea
        // - Usa contains() para verificar si existe
        // - Usa remove() para eliminarla
        break;
        
      case '3':
        // TODO: Eliminar por posición
        // - Muestra las tareas con índices
        // - Lee la posición
        // - Valida que esté en rango
        // - Usa removeAt()
        break;
        
      case '4':
        // TODO: Buscar tarea
        // - Lee el nombre
        // - Usa contains() e indexOf()
        // - Muestra si existe y su posición
        break;
        
      case '5':
        // TODO: Mostrar tareas
        // - Verifica si la lista está vacía con isEmpty
        // - Recorre con for o forEach
        // - Muestra índice y tarea
        break;
        
      case '6':
        // TODO: Limpiar tareas
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
```

**Funcionalidad adicional (desafío):**
- Marca tareas como completadas (usa una lista paralela de bool)
- Ordena las tareas alfabéticamente con `sort()`
- Filtra solo las tareas pendientes o completadas

---

## Ejercicio 2: Análisis Estadístico de Calificaciones 📊

Crea un programa que analice una lista de calificaciones usando métodos de transformación y búsqueda.

**Requisitos:**
- Lee 10 calificaciones desde la consola
- Usa métodos de listas para calcular:
  - Promedio (usando `reduce()` o `fold()`)
  - Calificación más alta (usando `reduce()`)
  - Calificación más baja (usando `reduce()`)
  - Cuántas aprobadas (>= 5) usando `where()`
  - Cuántas sobresalientes (>= 9) usando `where()`
- Ordena las calificaciones de menor a mayor
- Muestra las calificaciones ordenadas de mayor a menor

**Código base:**
```dart
import 'dart:io';

void main() {
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
  // double promedio = calificaciones.reduce((a, b) => a + b) / calificaciones.length;
  
  // TODO: Encontrar máxima y mínima
  // double maxima = calificaciones.reduce((a, b) => a > b ? a : b);
  // double minima = calificaciones.reduce((a, b) => a < b ? a : b);
  
  // TODO: Contar aprobadas
  // var aprobadas = calificaciones.where((nota) => nota >= 5);
  // int cantidadAprobadas = aprobadas.length;
  
  // TODO: Contar sobresalientes
  // var sobresalientes = calificaciones.where((nota) => nota >= 9);
  
  // TODO: Ordenar de menor a mayor
  // var ordenadas = List<double>.from(calificaciones);
  // ordenadas.sort();
  
  // TODO: Ordenar de mayor a menor
  // var descendente = List<double>.from(calificaciones);
  // descendente.sort((a, b) => b.compareTo(a));
  
  // TODO: Mostrar resultados
  print('\n═══ RESULTADOS ═══');
  // print('Calificaciones: $calificaciones');
  // print('Promedio: ${promedio.toStringAsFixed(2)}');
  // print('Máxima: $maxima');
  // print('Mínima: $minima');
  // print('Aprobadas: $cantidadAprobadas');
  // print('Sobresalientes: ${sobresalientes.length}');
  // print('Ordenadas (↑): $ordenadas');
  // print('Ordenadas (↓): $descendente');
}
```

**Desafío adicional:**
- Calcula la mediana (valor del medio después de ordenar)
- Identifica la calificación más repetida (moda)
- Usa `map()` para convertir calificaciones a letras (A, B, C, D, F)

---

## Ejercicio 3: Manipulador de Listas Numéricas 🔢

Practica los métodos de transformación y generación de listas.

**Requisitos:**
- Genera una lista de 20 números usando `List.generate()`
- Transforma la lista usando `map()`:
  - Duplica cada número
  - Eleva al cuadrado
  - Convierte a negativos
- Filtra elementos usando `where()`:
  - Solo números pares
  - Solo números mayores a 50
  - Solo múltiplos de 3
- Usa `any()` y `every()` para verificar condiciones
- Expande elementos usando `expand()`

**Código base:**
```dart
void main() {
  print('╔═══════════════════════════════════════╗');
  print('║  MANIPULADOR DE LISTAS                ║');
  print('╚═══════════════════════════════════════╝\n');
  
  // Generar lista de 1 a 20
  var numeros = List<int>.generate(20, (index) => index + 1);
  print('Lista original: $numeros\n');
  
  // TODO: Duplicar cada número con map()
  print('═══ MAP (transformar) ═══');
  // var duplicados = numeros.map((n) => n * 2).toList();
  // print('Duplicados: $duplicados');
  
  // TODO: Elevar al cuadrado
  // var cuadrados = numeros.map((n) => n * n).toList();
  // print('Cuadrados: $cuadrados');
  
  // TODO: Convertir a negativos
  // var negativos = numeros.map((n) => -n).toList();
  // print('Negativos: $negativos');
  
  // TODO: Filtrar pares con where()
  print('\n═══ WHERE (filtrar) ═══');
  // var pares = numeros.where((n) => n % 2 == 0).toList();
  // print('Pares: $pares');
  
  // TODO: Filtrar mayores a 10
  // var mayores = numeros.where((n) => n > 10).toList();
  // print('Mayores a 10: $mayores');
  
  // TODO: Filtrar múltiplos de 3
  // var multiplos3 = numeros.where((n) => n % 3 == 0).toList();
  // print('Múltiplos de 3: $multiplos3');
  
  // TODO: Verificar con any() y every()
  print('\n═══ ANY y EVERY (verificar) ═══');
  // bool hayMayorA50 = numeros.any((n) => n > 50);
  // bool todosMenoresA100 = numeros.every((n) => n < 100);
  // print('¿Hay alguno mayor a 50? $hayMayorA50');
  // print('¿Todos son menores a 100? $todosMenoresA100');
  
  // TODO: Expandir elementos
  print('\n═══ EXPAND (expandir) ═══');
  // var expandido = numeros.take(5).expand((n) => [n, n * 10, n * 100]).toList();
  // print('Expandido (primeros 5): $expandido');
  
  // TODO: Operaciones en cadena
  print('\n═══ OPERACIONES EN CADENA ═══');
  // var resultado = numeros
  //     .where((n) => n % 2 == 0)    // Solo pares
  //     .map((n) => n * n)           // Elevar al cuadrado
  //     .where((n) => n < 200)       // Menores a 200
  //     .toList();
  // print('Resultado: $resultado');
}
```

**Desafío adicional:**
- Usa `reduce()` para multiplicar todos los números (factorial simulado)
- Usa `fold()` para concatenar números en un string
- Combina `take()` y `skip()` para tomar elementos del medio

---

## Ejercicio 4: Gestor de Inventario con Sublistas 📦

Trabaja con listas, sublistas y búsquedas complejas.

**Requisitos:**
- Crea una lista de productos (nombres)
- Crea una lista paralela de cantidades (int)
- Crea una lista paralela de precios (double)
- Implementa funciones para:
  - Agregar producto con cantidad y precio
  - Buscar producto por nombre (indexOf)
  - Actualizar cantidad o precio
  - Eliminar producto (sincronizar las 3 listas)
  - Mostrar inventario completo
  - Calcular valor total del inventario
  - Encontrar productos con stock bajo (< 5)
  - Ordenar productos por precio

**Código base:**
```dart
import 'dart:io';

class Inventario {
  List<String> productos = [];
  List<int> cantidades = [];
  List<double> precios = [];
  
  void agregarProducto(String nombre, int cantidad, double precio) {
    // TODO: Añadir a las tres listas
    // productos.add(nombre);
    // cantidades.add(cantidad);
    // precios.add(precio);
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
}

void main() {
  var inventario = Inventario();
  
  // Datos de prueba
  inventario.agregarProducto('Laptop', 10, 899.99);
  inventario.agregarProducto('Mouse', 3, 25.50);
  inventario.agregarProducto('Teclado', 15, 49.99);
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
}
```

**Desafío adicional:**
- Ordena los productos por precio (necesitarás ordenar las 3 listas sincronizadamente)
- Implementa búsqueda case-insensitive
- Añade categorías a los productos

---

## Ejercicio 5: Procesador de Texto con Listas 📄

Manipula texto usando listas de strings.

**Requisitos:**
- Lee un texto desde la consola
- Separa el texto en palabras (usa `split()`)
- Realiza las siguientes operaciones:
  - Cuenta total de palabras
  - Encuentra la palabra más larga (usando `reduce()`)
  - Encuentra la palabra más corta
  - Elimina palabras duplicadas (usando `toSet()`)
  - Ordena palabras alfabéticamente
  - Filtra palabras de más de 5 letras
  - Cuenta cuántas palabras empiezan con vocal
  - Invierte el orden de las palabras
  - Une las palabras de nuevo en texto

**Código base:**
```dart
import 'dart:io';

void main() {
  print('╔═══════════════════════════════════════╗');
  print('║     PROCESADOR DE TEXTO               ║');
  print('╚═══════════════════════════════════════╝\n');
  
  stdout.write('Ingresa un texto: ');
  String? texto = stdin.readLineSync();
  
  if (texto == null || texto.isEmpty) {
    print('❌ No ingresaste texto');
    return;
  }
  
  // Separar en palabras
  List<String> palabras = texto.split(' ');
  
  print('\n═══ ANÁLISIS ═══');
  print('Total de palabras: ${palabras.length}');
  
  // TODO: Palabra más larga
  // String masLarga = palabras.reduce((a, b) => a.length > b.length ? a : b);
  // print('Palabra más larga: $masLarga (${masLarga.length} letras)');
  
  // TODO: Palabra más corta
  // String masCorta = palabras.reduce((a, b) => a.length < b.length ? a : b);
  // print('Palabra más corta: $masCorta (${masCorta.length} letras)');
  
  // TODO: Eliminar duplicados
  // var sinDuplicados = palabras.toSet().toList();
  // print('Sin duplicados: ${sinDuplicados.length} palabras únicas');
  
  // TODO: Ordenar alfabéticamente
  // var ordenadas = List<String>.from(palabras);
  // ordenadas.sort();
  // print('Ordenadas: $ordenadas');
  
  // TODO: Filtrar palabras largas (> 5 letras)
  // var largas = palabras.where((p) => p.length > 5).toList();
  // print('Palabras de más de 5 letras: $largas');
  
  // TODO: Contar palabras que empiezan con vocal
  // var conVocal = palabras.where((p) {
  //   var primera = p.toLowerCase()[0];
  //   return 'aeiou'.contains(primera);
  // });
  // print('Palabras que empiezan con vocal: ${conVocal.length}');
  
  // TODO: Invertir orden
  // var invertidas = palabras.reversed.toList();
  // print('Invertidas: $invertidas');
  
  // TODO: Unir de nuevo
  // var textoInvertido = invertidas.join(' ');
  // print('Texto invertido: $textoInvertido');
  
  // TODO: Operaciones en cadena
  print('\n═══ TRANSFORMACIÓN COMPLEJA ═══');
  // var resultado = palabras
  //     .where((p) => p.length > 3)          // Más de 3 letras
  //     .map((p) => p.toUpperCase())         // A mayúsculas
  //     .toList();
  // resultado.sort();                        // Ordenar
  // print('Resultado: $resultado');
}
```

**Salida esperada (ejemplo):**
```
╔═══════════════════════════════════════╗
║     PROCESADOR DE TEXTO               ║
╚═══════════════════════════════════════╝

Ingresa un texto: Dart es un lenguaje de programación moderno y moderno

═══ ANÁLISIS ═══
Total de palabras: 9
Palabra más larga: programación (12 letras)
Palabra más corta: es (2 letras)
Sin duplicados: 8 palabras únicas
Ordenadas: [Dart, de, es, lenguaje, moderno, moderno, programación, un, y]
Palabras de más de 5 letras: [lenguaje, programación, moderno, moderno]
Palabras que empiezan con vocal: 3
Invertidas: [moderno, y, moderno, programación, de, lenguaje, un, es, Dart]
Texto invertido: moderno y moderno programación de lenguaje un es Dart

═══ TRANSFORMACIÓN COMPLEJA ═══
Resultado: [DART, LENGUAJE, MODERNO, MODERNO, PROGRAMACIÓN]
```

**Desafío adicional:**
- Implementa una función que cuente la frecuencia de cada palabra
- Reemplaza palabras específicas (como `replace()`)
- Crea un acrónimo tomando la primera letra de cada palabra

---

## 🎯 Objetivos de Aprendizaje

Estos ejercicios te ayudarán a practicar:

- ✅ Creación y manipulación de listas
- ✅ Métodos de consulta: `contains()`, `indexOf()`, `isEmpty`
- ✅ Métodos de modificación: `add()`, `remove()`, `insert()`, `clear()`
- ✅ Métodos de transformación: `map()`, `where()`, `forEach()`
- ✅ Métodos de búsqueda: `firstWhere()`, `any()`, `every()`
- ✅ Ordenamiento con `sort()`
- ✅ Generación con `List.generate()`
- ✅ Operaciones en cadena (chaining)
- ✅ Listas paralelas (sincronización)
- ✅ Extensions personalizadas

---

## 📝 Consejos

1. **Validación de índices**: Siempre verifica que el índice esté en rango antes de usar `[]`, `removeAt()`, etc.
2. **Listas paralelas**: Mantén sincronizadas las operaciones en todas las listas relacionadas
3. **Inmutabilidad**: `map()`, `where()`, `toList()` crean nuevas listas, no modifican la original
4. **Performance**: `contains()` es O(n), considera usar `Set` si necesitas búsquedas frecuentes
5. **Chaining**: Encadena operaciones para código más legible y funcional
6. **Copia de listas**: Usa `List.from()` o `[...lista]` para copiar sin modificar el original
7. **Extensions**: Crea extensions para funcionalidad reutilizable en listas

¡Buena suerte! 🚀
