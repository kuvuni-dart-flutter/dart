# Ejercicios de Nivel Medio - Operadores en Dart

Basados en [ejemplo2.dart](../examples/ejemplo2.dart)

---

## Ejercicio 1: Calculadora de Propinas 💰

Crea un programa que calcule la propina basándose en el total de la cuenta y la calidad del servicio.

**Requisitos:**
- Lee el total de la cuenta desde la consola
- Lee la calidad del servicio: "excelente", "bueno", "regular"
- Calcula la propina: Excelente (20%), Bueno (15%), Regular (10%)
- Usa operador ternario para determinar el porcentaje
- Muestra el desglose: subtotal, propina, total final

**Código base:**
```dart
import 'dart:io';

void main() {
  stdout.write('Ingresa el total de la cuenta (€): ');
  String? cuentaStr = stdin.readLineSync();
  double? cuenta = double.tryParse(cuentaStr ?? '0');
  
  if (cuenta == null || cuenta <= 0) {
    print('❌ Cantidad inválida');
    return;
  }
  
  stdout.write('Calidad del servicio (excelente/bueno/regular): ');
  String? servicio = stdin.readLineSync()?.toLowerCase();
  
  // TODO: Calcula el porcentaje de propina usando operador ternario
  // double porcentaje = ...
  
  // TODO: Calcula la propina y el total
  // double propina = ...
  // double total = ...
  
  // TODO: Muestra el desglose
}
```

**Salida esperada:**
```
Ingresa el total de la cuenta (€): 45.50
Calidad del servicio (excelente/bueno/regular): excelente

=== DESGLOSE ===
Subtotal: €45.50
Propina (20%): €9.10
TOTAL: €54.60
```

---

## Ejercicio 2: Verificador de Año Bisiesto 📅

Determina si un año es bisiesto usando operadores lógicos.

**Reglas:**
- Un año es bisiesto si:
  - Es divisible por 4 Y no es divisible por 100
  - O es divisible por 400

**Requisitos:**
- Lee el año desde la consola
- Usa operadores de módulo (%) para verificar divisibilidad
- Combina condiciones con operadores lógicos (&&, ||)
- Muestra si es bisiesto o no

**Código base:**
```dart
import 'dart:io';

void main() {
  stdout.write('Ingresa un año: ');
  String? anioStr = stdin.readLineSync();
  int? anio = int.tryParse(anioStr ?? '0');
  
  if (anio == null || anio <= 0) {
    print('❌ Año inválido');
    return;
  }
  
  // TODO: Verifica si es bisiesto usando operadores lógicos
  // bool esBisiesto = ...
  
  // TODO: Muestra el resultado con un mensaje claro
}
```

**Casos de prueba:**
- 2024 → Es bisiesto (divisible por 4 y no por 100)
- 1900 → No es bisiesto (divisible por 100 pero no por 400)
- 2000 → Es bisiesto (divisible por 400)
- 2023 → No es bisiesto

---

## Ejercicio 3: Gestor de Tareas con Clases y Cascadas 📝

Crea un sistema de gestión de tareas usando clases y el operador de cascada.

**Requisitos:**
- Clase `Tarea` con: título, descripción, prioridad (1-5), completada (bool)
- Método `marcarCompletada()` que cambie el estado
- Método `mostrarInfo()` que imprima los detalles
- Crea varias tareas usando el operador de cascada
- Usa operador ternario para mostrar el estado

**Código base:**
```dart
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
    String nivelPrioridad = (prioridad >= 4) ? '🔴 Alta' :
                            (prioridad >= 2) ? '🟡 Media' : '🟢 Baja';
    
    print('\n╔════════════════════════════════════════╗');
    print('  📌 $titulo');
    print('  📄 $descripcion');
    print('  🎯 Prioridad: $nivelPrioridad ($prioridad)');
    print('  📊 Estado: $estado');
    print('╚════════════════════════════════════════╝');
  }
}

void main() {
  print('=== GESTOR DE TAREAS ===\n');
  
  // TODO: Crea al menos 3 tareas usando cascadas
  // Ejemplo:
  // Tarea()
  //   ..titulo = 'Estudiar Dart'
  //   ..descripcion = 'Completar ejercicios del curso'
  //   ..prioridad = 5
  //   ..mostrarInfo();
  
  // TODO: Crea una tarea, márcala como completada y muestra su info
}
```

**Desafío adicional:**
- Añade un método que calcule cuántos días faltan para la fecha límite
- Crea una lista de tareas y muestra solo las pendientes

---

## Ejercicio 4: Conversor de Unidades 🔄

Crea un conversor que transforme entre diferentes unidades usando operadores aritméticos.

**Requisitos:**
- Lee un valor y la unidad origen desde la consola
- Convierte a todas las unidades relacionadas
- Categorías: Temperatura (C, F, K), Distancia (km, m, mi), Peso (kg, g, lb)
- Usa operador de tipo (is) para validar
- Muestra todos los resultados con formato

**Código base:**
```dart
import 'dart:io';

class ConversorTemperatura {
  double celsius = 0.0;
  
  double aFahrenheit() => (celsius * 9/5) + 32;
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
  // double aMetros() => ...
  // double aMillas() => ... // 1 km = 0.621371 millas
  
  void mostrarConversiones() {
    // TODO: Muestra todas las conversiones
  }
}

class ConversorPeso {
  double kilogramos = 0.0;
  
  // TODO: Implementa las conversiones
  // double aGramos() => ...
  // double aLibras() => ... // 1 kg = 2.20462 libras
  
  void mostrarConversiones() {
    // TODO: Muestra todas las conversiones
  }
}

void main() {
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
}
```

---

## Ejercicio 5: Analizador de Calificaciones 📊

Crea un sistema que analice calificaciones y genere estadísticas.

**Requisitos:**
- Lee 5 calificaciones desde la consola (0-10)
- Calcula: promedio, nota más alta, nota más baja
- Determina si aprobó (promedio >= 5)
- Cuenta cuántas son sobresalientes (>= 9), notables (>= 7), aprobados (>= 5), suspensos (< 5)
- Usa operadores de comparación y lógicos
- Muestra un reporte completo con operador ternario para los mensajes

**Código base:**
```dart
import 'dart:io';

void main() {
  print('=== ANALIZADOR DE CALIFICACIONES ===\n');
  
  List<double> notas = [];
  
  // Leer 5 calificaciones
  for (int i = 1; i <= 5; i++) {
    stdout.write('Ingresa la calificación $i (0-10): ');
    String? notaStr = stdin.readLineSync();
    double? nota = double.tryParse(notaStr ?? '0');
    
    if (nota == null || nota < 0 || nota > 10) {
      print('❌ Calificación inválida. Usa valores entre 0 y 10.');
      i--; // Repetir esta iteración
      continue;
    }
    
    notas.add(nota);
  }
  
  // TODO: Calcula el promedio
  // double promedio = ...
  
  // TODO: Encuentra la nota más alta y más baja
  // double notaMax = ...
  // double notaMin = ...
  
  // TODO: Cuenta las categorías
  int sobresalientes = 0;
  int notables = 0;
  int aprobados = 0;
  int suspensos = 0;
  
  // for (double nota in notas) {
  //   if (...) sobresalientes++;
  //   else if (...) notables++;
  //   ...
  // }
  
  // TODO: Muestra el reporte
  print('\n╔════════════════════════════════════════╗');
  print('           REPORTE DE CALIFICACIONES     ');
  print('╚════════════════════════════════════════╝');
  // print('Calificaciones: ${notas.join(', ')}');
  // print('Promedio: ${promedio.toStringAsFixed(2)}');
  // ...
  
  // TODO: Usa operador ternario para mostrar si aprobó
  // String resultado = (promedio >= 5) ? '✅ APROBADO' : '❌ SUSPENSO';
}
```

**Salida esperada:**
```
=== ANALIZADOR DE CALIFICACIONES ===

Ingresa la calificación 1 (0-10): 8.5
Ingresa la calificación 2 (0-10): 7.0
Ingresa la calificación 3 (0-10): 9.5
Ingresa la calificación 4 (0-10): 6.5
Ingresa la calificación 5 (0-10): 8.0

╔════════════════════════════════════════╗
           REPORTE DE CALIFICACIONES     
╚════════════════════════════════════════╝
Calificaciones: 8.5, 7.0, 9.5, 6.5, 8.0
Promedio: 7.90
Nota más alta: 9.50
Nota más baja: 6.50

📊 Distribución:
   Sobresalientes (9-10): 1
   Notables (7-8.99): 3
   Aprobados (5-6.99): 1
   Suspensos (0-4.99): 0

Resultado: ✅ APROBADO
```

---

## 🎯 Objetivos de Aprendizaje

Estos ejercicios te ayudarán a practicar:

- ✅ Operadores aritméticos en cálculos reales
- ✅ Operadores lógicos para condiciones complejas
- ✅ Operador ternario para decisiones concisas
- ✅ Operadores de cascada para código más limpio
- ✅ Operadores de tipo para validación
- ✅ Entrada/salida con consola
- ✅ Clases y métodos
- ✅ Formateo de números y strings

---

## 📝 Consejos

1. **Operador ternario anidado**: Puedes anidar varios ternarios, pero no abuses o el código se volverá ilegible
2. **Cascadas**: Úsalas cuando necesites múltiples operaciones sobre el mismo objeto
3. **Validación**: Siempre valida la entrada del usuario con `tryParse` y el operador `??`
4. **División por cero**: Verifica antes de dividir para evitar errores
5. **Formato**: Usa `toStringAsFixed(n)` para controlar decimales

¡Buena suerte! 🚀
