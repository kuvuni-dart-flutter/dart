# 📋 Ejercicios - Ejemplo 3_3: Estructuras de Control Avanzadas

## Nivel: Avanzado

---

## Ejercicio 1: Sistema de Procesamiento de Pedidos con Pattern Matching

### 📝 Enunciado
Crea un sistema de procesamiento de pedidos que:
1. Recibe una lista de pedidos donde cada pedido es un `dynamic` que puede ser:
   - Un `String` con el nombre del producto
   - Un `int` con la cantidad
   - Un `Map<String, dynamic>` con información completa: `{'producto': String, 'cantidad': int, 'urgente': bool}`
2. Usa **switch expressions** con pattern matching para procesar cada tipo de pedido
3. Aplica diferentes tarifas según el tipo:
   - String simple: tarifa base de €10
   - Int (cantidad): €5 por unidad
   - Map completo: €15 base + €3 por unidad, si es urgente añade €10 extra
4. Usa **guard clauses** para validar cantidades negativas o cero
5. Calcula el total y muestra un resumen detallado

**Pedidos de prueba:**
```dart
['Laptop', 5, {'producto': 'Mouse', 'cantidad': 3, 'urgente': true}, 
 {'producto': 'Teclado', 'cantidad': 2, 'urgente': false}, -1, 'Monitor']
```

### 🎯 Salida Esperada
```
╔══════════════════════════════════════╗
║  SISTEMA DE PROCESAMIENTO            ║
║  DE PEDIDOS                          ║
╚══════════════════════════════════════╝

📦 Procesando pedido #1:
Tipo: Producto simple (String)
Producto: Laptop
Tarifa: €10.00

📦 Procesando pedido #2:
Tipo: Cantidad simple (int)
Cantidad: 5 unidades
Tarifa: €25.00

📦 Procesando pedido #3:
Tipo: Pedido completo (Map)
Producto: Mouse
Cantidad: 3 unidades
⚡ URGENTE
Tarifa: €15.00 (base) + €9.00 (unidades) + €10.00 (urgente) = €34.00

📦 Procesando pedido #4:
Tipo: Pedido completo (Map)
Producto: Teclado
Cantidad: 2 unidades
Tarifa: €15.00 (base) + €6.00 (unidades) = €21.00

📦 Procesando pedido #5:
❌ Error: Cantidad inválida (-1). Pedido ignorado.

📦 Procesando pedido #6:
Tipo: Producto simple (String)
Producto: Monitor
Tarifa: €10.00

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💰 TOTAL A PAGAR: €100.00
✅ Pedidos procesados exitosamente: 5
❌ Pedidos con error: 1
```

⏱️ **Tiempo estimado:** 30-35 minutos

---

## Ejercicio 2: Simulador de Batalla por Turnos

### 📝 Enunciado
Crea un simulador de batalla entre dos personajes que:
1. Define dos personajes con: `nombre`, `vida` (100 puntos), y `ataque` (10-30 puntos aleatorios por turno)
2. Los personajes atacan por turnos hasta que uno llegue a 0 de vida
3. Usa **bucles con etiquetas** para controlar el flujo de batalla
4. En cada turno:
   - Muestra el estado de salud de ambos
   - El atacante hace daño aleatorio (usa una lista predefinida de ataques)
   - Si el defensor tiene vida <= 20, tiene 30% de probabilidad de hacer un contraataque
5. Usa **where** y **forEach** para analizar estadísticas al final
6. Muestra el ganador y las estadísticas de la batalla

**Configuración:**
- Personaje 1: "Guerrero", Vida: 100
- Personaje 2: "Mago", Vida: 100
- Ataques simulados P1: `[25, 15, 30, 20, 18]`
- Ataques simulados P2: `[28, 22, 16, 25, 12]`
- Contraataques (cuando vida <= 20): `[10, 8]`

### 🎯 Salida Esperada
```
╔══════════════════════════════════════╗
║  SIMULADOR DE BATALLA                ║
╚══════════════════════════════════════╝

⚔️ Guerrero (❤️100) VS Mago (❤️100)

━━━━━━ TURNO 1 ━━━━━━
⚔️ Guerrero ataca a Mago
💥 Daño infligido: 25
📊 Mago: 100 → 75 HP

━━━━━━ TURNO 2 ━━━━━━
⚔️ Mago ataca a Guerrero
💥 Daño infligido: 28
📊 Guerrero: 100 → 72 HP

━━━━━━ TURNO 3 ━━━━━━
⚔️ Guerrero ataca a Mago
💥 Daño infligido: 15
📊 Mago: 75 → 60 HP

━━━━━━ TURNO 4 ━━━━━━
⚔️ Mago ataca a Guerrero
💥 Daño infligido: 22
📊 Guerrero: 72 → 50 HP

━━━━━━ TURNO 5 ━━━━━━
⚔️ Guerrero ataca a Mago
💥 Daño infligido: 30
📊 Mago: 60 → 30 HP

━━━━━━ TURNO 6 ━━━━━━
⚔️ Mago ataca a Guerrero
💥 Daño infligido: 16
📊 Guerrero: 50 → 34 HP

━━━━━━ TURNO 7 ━━━━━━
⚔️ Guerrero ataca a Mago
💥 Daño infligido: 20
📊 Mago: 30 → 10 HP
⚠️ Mago está en estado crítico!

━━━━━━ TURNO 8 ━━━━━━
⚔️ Mago ataca a Guerrero
💥 Daño infligido: 25
📊 Guerrero: 34 → 9 HP
⚠️ Guerrero está en estado crítico!
🔄 Guerrero realiza contraataque!
💥 Contraataque: 10 de daño
📊 Mago: 10 → 0 HP

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🏆 ¡GUERRERO GANA LA BATALLA!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📊 ESTADÍSTICAS DE BATALLA:
✓ Turnos totales: 8
✓ Daño total del Guerrero: 110
✓ Daño total del Mago: 91
✓ Contraataques realizados: 1
✓ Vida restante del ganador: 9 HP
```

⏱️ **Tiempo estimado:** 35-40 minutos

---

## Ejercicio 3: Analizador de Configuración con Switch Expressions

### 📝 Enunciado
Crea un analizador de archivos de configuración que:
1. Procesa una lista de configuraciones en diferentes formatos
2. Usa **switch expressions** (Dart 3.0+) para determinar el tipo de configuración
3. Cada configuración puede ser:
   - `Map<String, String>`: configuración simple → "Config: clave=valor"
   - `List<String>`: lista de opciones → "Lista con N opciones"
   - `String`: comentario (empieza con #) o configuración en formato "clave=valor"
   - `int`: nivel de configuración (1=básico, 2=intermedio, 3=avanzado)
4. Valida y procesa cada entrada, ignorando comentarios
5. Usa **guard clauses** (when) para validaciones específicas
6. Genera un reporte final con estadísticas

**Configuraciones de prueba:**
```dart
[
  {'database': 'MySQL'},
  ['opcion1', 'opcion2', 'opcion3'],
  '# Este es un comentario',
  'puerto=8080',
  2,
  {'host': 'localhost', 'puerto': '3306'},
  'timeout=30',
  3,
  '# Otro comentario'
]
```

### 🎯 Salida Esperada
```
╔══════════════════════════════════════╗
║  ANALIZADOR DE CONFIGURACIÓN         ║
╚══════════════════════════════════════╝

📋 Procesando configuraciones...

[1] Tipo: Map (Configuración simple)
    ✓ database = MySQL

[2] Tipo: List (Lista de opciones)
    ✓ Lista con 3 opciones: [opcion1, opcion2, opcion3]

[3] Tipo: String (Comentario)
    ⏭️ Ignorado: # Este es un comentario

[4] Tipo: String (Configuración)
    ✓ puerto = 8080

[5] Tipo: int (Nivel de configuración)
    ✓ Nivel: Intermedio (2)

[6] Tipo: Map (Configuración múltiple)
    ✓ host = localhost
    ✓ puerto = 3306

[7] Tipo: String (Configuración)
    ✓ timeout = 30

[8] Tipo: int (Nivel de configuración)
    ✓ Nivel: Avanzado (3)

[9] Tipo: String (Comentario)
    ⏭️ Ignorado: # Otro comentario

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📊 ESTADÍSTICAS:
✓ Total de entradas: 9
✓ Configuraciones procesadas: 7
✓ Comentarios ignorados: 2
✓ Maps procesados: 2
✓ Listas procesadas: 1
✓ Strings procesados: 2
✓ Niveles definidos: 2
```

⏱️ **Tiempo estimado:** 25-30 minutos

---

## Ejercicio 4: Sistema de Rutas con Switch de Records

### 📝 Enunciado
Crea un sistema de navegación que:
1. Procesa comandos de movimiento en una cuadrícula 2D
2. Usa **switch con records** para pattern matching de coordenadas
3. La posición inicial es (0, 0) - origen
4. Comandos disponibles: 'N' (norte), 'S' (sur), 'E' (este), 'O' (oeste)
5. Detecta zonas especiales según la posición:
   - (0, 0): "📍 Origen"
   - Eje X (y=0): "➡️ Zona Este-Oeste"
   - Eje Y (x=0): "⬆️ Zona Norte-Sur"
   - Cuadrante I (x>0, y>0): "🌟 Zona Premium"
   - Cuadrante II (x<0, y>0): "🌲 Zona Bosque"
   - Cuadrante III (x<0, y<0): "🌊 Zona Océano"
   - Cuadrante IV (x>0, y<0): "🏜️ Zona Desierto"
6. Detecta si está en el borde del mapa (|x| > 10 o |y| > 10)
7. Muestra el historial de movimientos

**Comandos de prueba:** `['N', 'N', 'E', 'E', 'E', 'N', 'O', 'S', 'S', 'S', 'S', 'O', 'O']`

### 🎯 Salida Esperada
```
╔══════════════════════════════════════╗
║  SISTEMA DE NAVEGACIÓN               ║
╚══════════════════════════════════════╝

🗺️ Posición inicial: (0, 0)
📍 Origen

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Movimiento #1: Norte (N)
📍 Nueva posición: (0, 1)
⬆️ Zona Norte-Sur (sobre eje Y)

Movimiento #2: Norte (N)
📍 Nueva posición: (0, 2)
⬆️ Zona Norte-Sur (sobre eje Y)

Movimiento #3: Este (E)
📍 Nueva posición: (1, 2)
🌟 Zona Premium (Cuadrante I)

Movimiento #4: Este (E)
📍 Nueva posición: (2, 2)
🌟 Zona Premium (Cuadrante I)

Movimiento #5: Este (E)
📍 Nueva posición: (3, 2)
🌟 Zona Premium (Cuadrante I)

Movimiento #6: Norte (N)
📍 Nueva posición: (3, 3)
🌟 Zona Premium (Cuadrante I)

Movimiento #7: Oeste (O)
📍 Nueva posición: (2, 3)
🌟 Zona Premium (Cuadrante I)

Movimiento #8: Sur (S)
📍 Nueva posición: (2, 2)
🌟 Zona Premium (Cuadrante I)

Movimiento #9: Sur (S)
📍 Nueva posición: (2, 1)
🌟 Zona Premium (Cuadrante I)

Movimiento #10: Sur (S)
📍 Nueva posición: (2, 0)
➡️ Zona Este-Oeste (sobre eje X)

Movimiento #11: Sur (S)
📍 Nueva posición: (2, -1)
🏜️ Zona Desierto (Cuadrante IV)

Movimiento #12: Oeste (O)
📍 Nueva posición: (1, -1)
🏜️ Zona Desierto (Cuadrante IV)

Movimiento #13: Oeste (O)
📍 Nueva posición: (0, -1)
⬆️ Zona Norte-Sur (sobre eje Y)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📊 RESUMEN DEL VIAJE:
✓ Posición final: (0, -1)
✓ Total de movimientos: 13
✓ Distancia del origen: 1 unidades
✓ Zonas visitadas:
  • Origen: 1 vez
  • Eje Y: 3 veces
  • Eje X: 1 vez
  • Cuadrante I: 7 veces
  • Cuadrante IV: 2 veces
```

⏱️ **Tiempo estimado:** 30-35 minutos

---

## 💡 Consejos

- **Switch expressions** devuelven un valor directamente, son más concisos que switch-case
- **Pattern matching** permite desestructurar datos complejos (records, maps, listas)
- **Guard clauses** (when) añaden condiciones adicionales a los patrones
- Usa **records** `(x, y)` para agrupar valores relacionados
- `where()` filtra elementos de una colección según una condición
- `forEach()` ejecuta una función para cada elemento
- Para calcular distancia: `sqrt(x*x + y*y)` (importa `dart:math`)
- Los bucles con etiquetas (`label:`) permiten control fino de bucles anidados
