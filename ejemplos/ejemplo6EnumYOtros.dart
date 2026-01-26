// Se necesitan estos imports para Queue.
import 'dart:collection';

// ============================================
// ENUMS Y OTRAS ESTRUCTURAS
// ============================================

// ============================================
// DEFINICIÓN DE ENUMS
// ============================================
// Los enums se definen fuera de las funciones, a nivel de archivo

  /* ¿QUÉ ES UN ENUM?
   * ================
   * Un Enum (enumeración) es un tipo especial que representa un conjunto
   * fijo de constantes con nombre.
   * 
   * CARACTERÍSTICAS:
   * - Define un conjunto cerrado de valores posibles
   * - Type-safe: el compilador verifica que uses valores válidos
   * - Mejor que usar Strings o números "mágicos"
   *   NÚMEROS MÁGICOS: valores sin nombre que aparecen en el código sin explicación
   *   Ejemplos MALOS (números mágicos):
   *     if (estado == 1) { ... }          // ¿Qué significa 1?
   *     if (codigo == "ERR_500") { ... }  // String mágico, fácil de confundir
   *     if (edad >= 18) { ... }           // ¿Por qué 18? No está claro
   *   
   *   Ejemplos BUENOS (sin números mágicos):
   *     enum Estado { pendiente, completado, cancelado }
   *     if (estado == Estado.completado) { ... }  // Claro y type-safe
   *     
   *   Ventajas de evitar números mágicos:
   *   - Código autodocumentado (claro para otros desarrolladores)
   *   - Mantenimiento fácil: cambiar el valor en un solo lugar
   *   - Autocompletado en IDEs funciona correctamente
   * - Autodocumentado: el código es más claro
   * - Soporte de autocompletado en IDEs
   * 
   * VENTAJAS VS CONSTANTES:
   * - const String ROJO = 'rojo'; // Cualquier String es válido
   * - enum Color { rojo, verde, azul } // Solo estos 3 valores son válidos
   * - Evita errores por valores inválidos
   */

// Enum básico
enum DiaSemana { lunes, martes, miercoles, jueves, viernes, sabado, domingo }

// Enum mejorado con campos y métodos (Dart 2.17+)
enum EstadoSemaforo {
  rojo('Detenerse', 30, false),
  amarillo('Precaución', 5, false),
  verde('Adelante', 45, true);

  // Campos del enum
  final String descripcion;
  final int duracionSegundos;
  final bool permiteAvanzar;

  // Constructor
  const EstadoSemaforo(
    this.descripcion,
    this.duracionSegundos,
    this.permiteAvanzar,
  );

  // Método personalizado
  bool puedePasar() {
    return permiteAvanzar;
  }
}

// Enum para prioridades
enum Prioridad { baja, media, alta, urgente }

void main() {
  print('╔══════════════════════════════╗');
  print('║  ENUMS Y OTRAS ESTRUCTURAS   ║');
  print('╚══════════════════════════════╝\n');

  // ============================================
  // PARTE 1: ENUMS (ENUMERACIONES)
  // ============================================
  /* ¿QUÉ ES UN ENUM?
   * ================
   * Un Enum (enumeración) es un tipo especial que representa un conjunto
   * fijo de constantes con nombre.
   * 
   * CARACTERÍSTICAS:
   * - Define un conjunto cerrado de valores posibles
   * - Type-safe: el compilador verifica que uses valores válidos
   * - Mejor que usar Strings o números "mágicos"
   * - Autodocumentado: el código es más claro
   * - Soporte de autocompletado en IDEs
   * 
   * VENTAJAS VS CONSTANTES:
   * - const String ROJO = 'rojo'; // Cualquier String es válido
   * - enum Color { rojo, verde, azul } // Solo estos 3 valores son válidos
   * - Evita errores por valores inválidos
   */

  print('\n\n═══ 1. ENUMS (ENUMERACIONES) ═══\n');

  // Los enums se definen fuera de la función main.
  // Aquí solo los usamos

  // 1.1 Uso básico de Enums
  // ========================
  print('1.1 USO BÁSICO DE ENUMS:');

  DiaSemana hoy = DiaSemana.lunes;
  print('Hoy es: $hoy'); // DiaSemana.lunes
  print('Nombre: ${hoy.name}'); // lunes

  // Switch con enums (exhaustivo)
  String mensaje = switch (hoy) {
    DiaSemana.lunes => '😫 Primer día de la semana',
    DiaSemana.martes => '💪 Segundo día',
    DiaSemana.miercoles => '🎯 Mitad de semana',
    DiaSemana.jueves => '😊 Casi viernes',
    DiaSemana.viernes => '🎉 ¡Viernes!',
    DiaSemana.sabado => '🏖️ Fin de semana',
    DiaSemana.domingo => '😴 Descanso',
  };
  print(mensaje);

  // Obtener todos los valores
  print('\nTodos los días:');
  for (var dia in DiaSemana.values) {
    print('  - ${dia.name}');
  }

  // Obtener por índice
  var tercerDia = DiaSemana.values[2];
  print('Tercer día: ${tercerDia.name}');

  // Obtener índice
  print('Índice de viernes: ${DiaSemana.viernes.index}');

  // 1.2 Enums mejorados (Dart 2.17+)
  // =================================
  print('\n1.2 ENUMS MEJORADOS:');

  var semaforo = EstadoSemaforo.verde;
  print('Estado actual: ${semaforo.descripcion}');
  print('Duración: ${semaforo.duracionSegundos}s');
  print('¿Puede pasar? ${semaforo.puedePasar()}');

  // Cambiar estado
  semaforo = EstadoSemaforo.amarillo;
  print('\nCambió a: ${semaforo.descripcion}');
  print('¿Puede pasar? ${semaforo.puedePasar()}');

  // 1.3 Enum con switch expression
  // ===============================
  print('\n1.3 ENUM CON SWITCH EXPRESSION:');

  Prioridad tarea = Prioridad.alta;

  String icono = switch (tarea) {
    Prioridad.baja => '🟢',
    Prioridad.media => '🟡',
    Prioridad.alta => '🔴',
    Prioridad.urgente => '🚨',
  };

  print('Prioridad $tarea: $icono');

  // Comparación de enums
  if (tarea.index > Prioridad.media.index) {
    print('⚠️ Atención: Prioridad elevada');
  }

  // ============================================
  // PARTE 2: OTRAS ESTRUCTURAS ÚTILES
  // ============================================
  print('\n\n═══ 2. OTRAS ESTRUCTURAS ÚTILES ═══\n');

  // 2.1 RECORDS (Tuplas) - Dart 3.0+
  // =================================
  /* ¿QUÉ SON LOS RECORDS?
   * =====================
   * Son estructuras ligeras e inmutables que agrupan múltiples valores
   * sin necesidad de crear una clase.
   * 
   * TIPOS:
   * - Posicionales: (valor1, valor2)
   * - Nombrados: (nombre: valor1, edad: valor2)
   * - Mixtos: (valor1, nombre: valor2)
   */

  print('2.1 RECORDS:');

  // Record posicional
  var coordenada = (10, 20);
  print('Coordenada: $coordenada');
  print('x: ${coordenada.$1}, y: ${coordenada.$2}');

  // Record nombrado
  var persona = (nombre: 'Ana', edad: 25, ciudad: 'Madrid');
  print('Persona: ${persona.nombre}, ${persona.edad} años');

  // Función que retorna record
  (String, int) obtenerDatos() {
    return ('Dart', 2023);
  }

  var (lenguaje, anio) = obtenerDatos(); // Destructuring
  print('Lenguaje: $lenguaje, Año: $anio');

  // Record como valor de retorno múltiple
  (int, int) dividir(int a, int b) {
    return (a ~/ b, a % b); // (cociente, resto)
  }

  var (cociente, resto) = dividir(17, 5);
  print('17 ÷ 5 = $cociente, resto: $resto');

  // 2.2 ITERABLES
  // =============
  // En Dart, muchos objetos heredan de Iterable:
  // - List: colección ordenada y accesible por índice
  // - Set: colección sin duplicados
  // - Queue: colección para FIFO/LIFO
  // - Map.values y Map.keys: devuelven iterables
  // - Ranges generados con Iterable.generate
  // - Strings pueden convertirse en Iterable de caracteres
  //
  // OPERACIONES LAZY (perezosas):
  // =============================
  // Una operación lazy (perezosa) no se ejecuta inmediatamente, sino que se evalúa solo cuando se necesita el resultado.
  // Ejemplo: métodos como map, where, take, skip en un Iterable no procesan los elementos hasta que los recorres o conviertes a lista.
  // Esto ahorra memoria y permite trabajar con colecciones muy grandes o infinitas.
  //
  // Ejemplo práctico:
  //   var iter = Iterable.generate(1000000).map((x) => x * 2); // No se calcula nada aún
  //   print(iter.take(5).toList()); // Solo se calculan los 5 primeros
  //
  // Ventajas:
  // - Eficiencia: solo se procesan los elementos necesarios
  // - Permite trabajar con secuencias infinitas
  // - Menor uso de memoria
  //
  // Esto permite usar métodos como forEach, map, where, reduce, take, skip, etc. en todas estas colecciones.

  print('\n2.2 ITERABLES:');

  // Iterable lazy (no se evalúa hasta que se necesita)
  Iterable<int> numerosLazy = Iterable.generate(5, (i) => i * 2);
  print('Iterable generado: $numerosLazy'); //
  print('Como lista: ${numerosLazy.toList()}');

  // Iterable infinito (con take para limitar)
  var naturales = Iterable.generate(100, (i) => i + 1);
  var primeros10 = naturales.take(10);
  print('Primeros 10 naturales: ${primeros10.toList()}');

  // Métodos de Iterable
  var nums = [1, 2, 3, 4, 5];
  print('Suma: ${nums.reduce((a, b) => a + b)}');
  print('Primer elemento: ${nums.first}');
  print('Último elemento: ${nums.last}');
  print('Primer par: ${nums.firstWhere((n) => n % 2 == 0)}');

  // 2.3 QUEUE (Cola)
  // ================
  print('\n2.3 QUEUE (COLA):');

  // Queue es una colección que permite agregar/eliminar eficientemente
  // desde ambos extremos.
  // FIFO (First In, First Out): el primer elemento en entrar es el primero en salir (como una cola de personas).
  // LIFO (Last In, First Out): el último elemento en entrar es el primero en salir (como una pila de platos).
  // Métodos útiles de Queue:
  // - add(element): agrega al final
  // - addFirst(element): agrega al inicio
  // - addLast(element): agrega al final
  // - removeFirst(): elimina y retorna el primero
  // - removeLast(): elimina y retorna el último
  // - clear(): elimina todos los elementos
  // - contains(element): verifica si existe
  // - length: cantidad de elementos
  // - isEmpty / isNotEmpty: verifica si está vacía
  // - forEach((e) => ...): recorre todos los elementos
  //
  // ¿Para qué se puede usar una Queue en Flutter?
  // - Para gestionar tareas pendientes (por ejemplo, descargas, animaciones, notificaciones)
  // - Para implementar historial de navegación o acciones (deshacer/rehacer)
  // - Para manejar eventos en tiempo real (mensajes, sockets)
  // - Para controlar el flujo de datos en streams o buffers
  // - Para organizar colas de usuarios, procesos o recursos en apps interactivas
  //
  // Ventajas de usar una Queue frente a una List:
  // - Operaciones de inserción/eliminación al inicio o final son más eficientes (O(1)) en Queue.
  // - List requiere mover elementos internamente al eliminar/agregar al inicio (O(n)).
  // - Queue está pensada para estructuras FIFO/LIFO, List para acceso por índice.
  // - Queue facilita la implementación de algoritmos de recorrido, buffers y gestión de tareas.
  // - Menos errores de lógica: el uso de métodos específicos de cola evita confusiones con índices.

  var cola = Queue<String>();

  // Agregar elementos
  cola.add('Primero');
  cola.add('Segundo');
  cola.addFirst('Cero'); // Agregar al inicio
  cola.addLast('Tercero'); // Agregar al final

  print('Cola: $cola');

  // Eliminar elementos
  var primero = cola.removeFirst();
  print('Eliminado del inicio: $primero');

  var ultimo = cola.removeLast();
  print('Eliminado del final: $ultimo');

  print('Cola después de eliminar: $cola');

  // ============================================
  // RESUMEN Y MEJORES PRÁCTICAS
  // ============================================
  print('\n\n╔═══════════════════════════════════════════╗');
  print('║  RESUMEN Y MEJORES PRÁCTICAS              ║');
  print('╚═══════════════════════════════════════════╝\n');

  print('''
📋 SETS:
   ✓ Usa Set para colecciones sin duplicados
   ✓ Operaciones de conjunto son muy eficientes
   ✓ Ideal para verificar pertenencia (contains)
   ✗ No uses Set si necesitas orden o acceso por índice

📚 MAPS:
   ✓ Usa Map para asociaciones clave-valor
   ✓ Claves únicas, valores pueden repetirse
   ✓ Acceso O(1) por clave es muy rápido
   ✗ No uses Map si solo necesitas una lista

🏷️ ENUMS:
   ✓ Usa Enum para conjuntos fijos de valores
   ✓ Mejor que Strings o números mágicos
   ✓ Type-safe y autodocumentado
   ✓ Enums mejorados (Dart 2.17+) con comportamiento

📦 RECORDS:
   ✓ Usa Records para retornos múltiples
   ✓ Alternativa ligera a clases pequeñas
   ✓ Inmutables por diseño
   ✗ No uses para estructuras complejas (usa clases)

🎯 OTRAS:
   ✓ Queue para FIFO/LIFO eficiente
   ✓ Iterable para operaciones lazy

''');
}
