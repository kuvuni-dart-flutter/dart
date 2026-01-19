# 📋 Ejercicios - Ejemplo 3_2: Estructuras de Control Intermedias

## Nivel: Medio-Avanzado

---

## Ejercicio 1: Sistema de Gestión de Tienda

### 📝 Enunciado
Crea un programa que simule un sistema de tienda con los siguientes requisitos:
1. Define un Map con productos y sus precios: `{'Manzana': 1.5, 'Pan': 2.0, 'Leche': 3.5, 'Huevos': 4.0, 'Queso': 5.5}`
2. Define una lista de compras del cliente: `['Manzana', 'Pan', 'Manzana', 'Leche', 'Queso']`
3. Calcula el total de la compra
4. Aplica descuentos según el total:
   - Si el total >= 10: 10% de descuento
   - Si el total >= 15: 15% de descuento
   - Si el total >= 20: 20% de descuento
5. Muestra un resumen detallado con cada producto, cantidad y precio
6. Si un producto de la lista no existe en la tienda, muéstralo como "No disponible"

### 🎯 Salida Esperada
```
╔══════════════════════════════════════╗
║  SISTEMA DE TIENDA                   ║
╚══════════════════════════════════════╝

🛒 CARRITO DE COMPRAS:

Producto: Manzana
  Cantidad: 2
  Precio unitario: €1.50
  Subtotal: €3.00

Producto: Pan
  Cantidad: 1
  Precio unitario: €2.00
  Subtotal: €2.00

Producto: Leche
  Cantidad: 1
  Precio unitario: €3.50
  Subtotal: €3.50

Producto: Queso
  Cantidad: 1
  Precio unitario: €5.50
  Subtotal: €5.50

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💰 RESUMEN:
Total sin descuento: €14.00
Descuento aplicado: 10% (-€1.40)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💵 TOTAL A PAGAR: €12.60
```

⏱️ **Tiempo estimado:** 25-30 minutos

---

## Ejercicio 2: Analizador de Texto

### 📝 Enunciado
Crea un programa que analice un texto y proporcione estadísticas:
1. Cuenta el número total de caracteres (incluyendo espacios)
2. Cuenta el número de palabras
3. Cuenta el número de vocales y consonantes
4. Identifica la palabra más larga y la más corta
5. Cuenta cuántas veces aparece cada vocal (a, e, i, o, u)
6. Usa `switch-case` para clasificar las vocales

**Texto de prueba:** 
`"Dart es un lenguaje de programacion moderno y versatil"`

### 🎯 Salida Esperada
```
╔══════════════════════════════════════╗
║  ANALIZADOR DE TEXTO                 ║
╚══════════════════════════════════════╝

📝 Texto: "Dart es un lenguaje de programacion moderno y versatil"

📊 ESTADÍSTICAS GENERALES:
✓ Total de caracteres: 56
✓ Total de palabras: 9
✓ Total de vocales: 23
✓ Total de consonantes: 26

📏 ANÁLISIS DE PALABRAS:
✓ Palabra más larga: "programacion" (12 letras)
✓ Palabra más corta: "es" (2 letras)

🔤 CONTEO DE VOCALES:
a: 7 veces
e: 6 veces
i: 3 veces
o: 5 veces
u: 2 veces
```

⏱️ **Tiempo estimado:** 30-35 minutos

---

## Ejercicio 3: Juego de Adivinanza con Intentos

### 📝 Enunciado
Crea un juego donde:
1. El programa "piensa" en un número **aleatorio** entre 1 y 50 (usa `Random().nextInt(50) + 1`)
2. El usuario tiene 7 intentos para adivinar (simula intentos con una lista predefinida)
3. Después de cada intento, da pistas: "más alto", "más bajo" o "correcto"
4. Si adivina, muestra en cuántos intentos lo logró y un mensaje de felicitación según el desempeño:
   - 1-2 intentos: "🏆 ¡Excelente!"
   - 3-4 intentos: "🥈 ¡Muy bien!"
   - 5-7 intentos: "🥉 ¡Lo lograste!"
5. Si no adivina en 7 intentos, muestra el número secreto
6. Usa `break` para salir cuando adivine

**📌 IMPLEMENTACIÓN DE NÚMERO ALEATORIO:**

Para generar números aleatorios en Dart:

```dart
import 'dart:math';  // ← Importar la librería math

void main() {
  // Crear una instancia de Random
  var random = Random();
  
  // Generar número aleatorio entre 1 y 50
  int numeroSecreto = random.nextInt(50) + 1;
  
  // Alternativa más corta:
  int numeroSecreto2 = Random().nextInt(50) + 1;
  
  print('Número generado: $numeroSecreto');
}
```

**Explicación:**
- `Random().nextInt(n)` genera un número entre 0 y n-1
- `Random().nextInt(50)` genera entre 0 y 49
- Sumamos `+ 1` para obtener el rango 1 a 50
- `import 'dart:math'` es necesario al inicio del archivo

**Lista de intentos simulados:** `[25, 40, 35, 38, 36, 37]`  
*(El número a adivinar cambiará en cada ejecución)*

### 🎯 Salida Esperada
```
╔══════════════════════════════════════╗
║  JUEGO DE ADIVINANZA                 ║
║  Adivina el número entre 1 y 50      ║
╚══════════════════════════════════════╝

� Número secreto generado: 37 (este número cambiará en cada ejecución)
🎯 Tienes 7 intentos

Intento #1: 25
💡 Pista: El número es más alto

Intento #2: 40
💡 Pista: El número es más bajo

Intento #3: 35
💡 Pista: El número es más alto

Intento #4: 38
💡 Pista: El número es más bajo

Intento #5: 36
💡 Pista: El número es más alto

Intento #6: 37
✅ ¡CORRECTO! Has adivinado el número

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🥉 ¡Lo lograste!
Número de intentos: 6/7
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

**Ejemplo si NO adivina:**
```
...
Intento #7: 45
💡 Pista: El número es más bajo

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
❌ ¡Se acabaron los intentos!
El número secreto era: 37
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

⏱️ **Tiempo estimado:** 20-25 minutos

---

## Ejercicio 4: Sistema de Reservas de Cine

### 📝 Enunciado
Crea un sistema de reservas de cine que:
1. Tenga 5 filas numeradas (1-5)
2. Cada fila tiene 8 asientos (A-H)
3. Representa los asientos como una lista de listas donde:
   - `'O'` = asiento ocupado
   - `'L'` = asiento libre
4. Muestra el mapa de asientos de forma visual
5. Procesa una lista de reservas: `[('1', 'A'), ('1', 'B'), ('3', 'D'), ('5', 'H'), ('2', 'C')]`
6. Para cada reserva, verifica si está libre y márcala como ocupada
7. Muestra un resumen de reservas exitosas y fallidas
8. Usa bucles anidados para mostrar el mapa

**Estado inicial de asientos (algunos ya ocupados):**
- Fila 1: L, L, O, L, L, L, O, L
- Fila 2: L, L, L, L, L, L, L, L
- Fila 3: O, O, L, L, L, L, L, L
- Fila 4: L, L, L, O, O, L, L, L
- Fila 5: L, L, L, L, L, L, L, L

### 🎯 Salida Esperada
```
╔══════════════════════════════════════╗
║  SISTEMA DE RESERVAS DE CINE         ║
╚══════════════════════════════════════╝

🎬 MAPA DE ASIENTOS INICIAL:
     A  B  C  D  E  F  G  H
  1 [L][L][O][L][L][L][O][L]
  2 [L][L][L][L][L][L][L][L]
  3 [O][O][L][L][L][L][L][L]
  4 [L][L][L][O][O][L][L][L]
  5 [L][L][L][L][L][L][L][L]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📋 PROCESANDO RESERVAS:

✅ Reserva exitosa: Fila 1, Asiento A
✅ Reserva exitosa: Fila 1, Asiento B
✅ Reserva exitosa: Fila 3, Asiento D
✅ Reserva exitosa: Fila 5, Asiento H
✅ Reserva exitosa: Fila 2, Asiento C

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎬 MAPA DE ASIENTOS FINAL:
     A  B  C  D  E  F  G  H
  1 [O][O][O][L][L][L][O][L]
  2 [L][L][O][L][L][L][L][L]
  3 [O][O][L][O][L][L][L][L]
  4 [L][L][L][O][O][L][L][L]
  5 [L][L][L][L][L][L][L][O]

📊 RESUMEN:
✅ Reservas exitosas: 5
❌ Reservas fallidas: 0
🎫 Total de asientos ocupados: 12/40
```

⏱️ **Tiempo estimado:** 35-40 minutos

---

## 💡 Consejos

- Usa `switch-case` con múltiples casos para agrupar condiciones similares
- Usa `for-in` para iterar sobre colecciones (listas, sets, maps)
- Usa `break` para salir de bucles prematuramente
- Usa `continue` para saltar a la siguiente iteración
- Para iterar sobre Maps usa `.entries`, `.keys` o `.values`
- Los bucles anidados son útiles para matrices (listas de listas)
- Usa variables contadoras para llevar estadísticas
