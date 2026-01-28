# EJERCICIO 4: SISTEMA DE RESERVAS DE HOTEL
## Nivel: EXPERTO

### Objetivo
Implementar un sistema completo de gestión hotelera que maneje habitaciones de diferentes tipos, reservas con períodos complejos, disponibilidad, notificaciones y reportes avanzados. Este ejercicio enfatiza **genéricos, patrones de diseño (Observer), cálculos complejos con fechas, composición avanzada y manejo de estados**.

---

## Requisitos del Sistema

### 1. Enums Requeridos (OBLIGATORIO)

#### TipoHabitacion
```dart
enum TipoHabitacion { 
  simple,      // Cama sencilla
  doble,       // Cama doble
  suite,       // Dos camas + sala
  penthouse    // Todo lujos
}
```

#### EstadoReserva
```dart
enum EstadoReserva { 
  pendiente,   // Esperando confirmación
  confirmada,  // Confirmada
  checkin,     // Huésped en hotel
  checkout,    // Huésped se fue
  cancelada    // Reserva cancelada
}
```

---

### 2. Clase Tarifa (OBLIGATORIO)
Gestiona precios por tipo de habitación y temporada:

#### Propiedades:
```dart
- tipoHabitacion: TipoHabitacion
- precioBase: double      // Precio en temporada normal
- precioAlta: double      // Precio en temporada alta (+30-50%)
- precioEconomica: double // Precio en temporada económica (-20-30%)
```

#### Métodos requeridos:
```dart
+ Tarifa(tipoHabitacion, precioBase, precioAlta, precioEconomica)
+ obtenerPrecio(fecha): double
  // Retorna: precioAlta si es verano/Navidad, precioEconomica si es invierno, precioBase en otros
+ obtenerDetalles(): String
```

#### Reglas de temporada:
- **Temporada Alta:** Junio-Agosto, 15-31 Diciembre
- **Temporada Económica:** Enero-Febrero, Noviembre
- **Temporada Normal:** Resto

---

### 3. Clase Habitacion (OBLIGATORIO)
Representa una habitación física:

#### Propiedades:
```dart
- numero: int          // Número único
- tipo: TipoHabitacion
- tarifa: Tarifa
- ocupantes: int       // Capacidad máxima
- disponible: bool     // Disponible actualmente
- servicios: List<String> // ["WiFi", "Aire Acondicionado", etc]
```

#### Métodos requeridos:
```dart
+ Habitacion(numero, tipo, tarifa, ocupantes, servicios)
+ obtenerInfo(): String
+ establecerDisponibilidad(disponible): void
+ tieneServicio(servicio): bool
+ obtenerPrecioParaDia(fecha): double
```

---

### 4. Clase RangoFechas (OBLIGATORIO - Uso de composición)
Gestiona períodos de tiempo:

#### Propiedades:
```dart
- fechaInicio: DateTime
- fechaFin: DateTime
```

#### Métodos requeridos:
```dart
+ RangoFechas(fechaInicio, fechaFin)
+ obtenerDias(): int              // Cantidad de días (inclusive)
+ contains(fecha): bool           // ¿Fecha está en el rango?
+ superpone(otro): bool           // ¿Se superpone con otro rango?
+ obtenerRango(): String          // "2026-02-01 a 2026-02-05"
```

---

### 5. Clase Reserva (OBLIGATORIO)
Representa una reserva de habitación:

#### Propiedades:
```dart
- numeroReserva: String        // Auto-generado: "RES-001", "RES-002"...
- habitacion: Habitacion
- cliente: String
- rango: RangoFechas
- estado: EstadoReserva        // Por defecto: pendiente
- personasAlojadas: int
- notasEspeciales: String?
- precioTotal: double          // Calculado en función de días y tarifa
```

#### Métodos requeridos:
```dart
+ Reserva(habitacion, cliente, rango, personasAlojadas, notasEspeciales)
+ obtenerResumen(): String
+ calcularPrecioTotal(): double  // Suma de precios diarios
+ cambiarEstado(nuevoEstado): void
+ cancelar(): bool               // Solo si estado es pendiente
+ confirmar(): bool              // Cambiar a confirmada
+ realizarCheckin(fecha): bool   // Validar fecha de inicio
+ realizarCheckout(fecha): bool  // Validar fecha de fin
```

#### Validaciones:
- No permitir reservas con más personas que capacidad de habitación
- No permitir cambios de estado inválidos (pendiente → confirmada, checkin → checkout, etc.)
- Cancelación solo si estado es pendiente

---

### 6. Clase Observador (INTERFAZ/ABSTRACT - PATRÓN OBSERVER)

```dart
abstract class ObservadorReserva {
  void notificarCambio(Reserva reserva, String evento);
}
```

#### Implementaciones sugeridas:
1. **RegistroHotel** - Registra todos los eventos
2. **GestorNotificaciones** - Envía alertas al cliente
3. **ControlInventario** - Actualiza disponibilidad

---

### 7. Clase Caja<T> Genérica (OBLIGATORIO - USO DE GENÉRICOS)

Contenedor genérico para almacenar y filtrar items:

```dart
class Caja<T> {
  List<T> items = [];
  
  + agregar(T item): void
  + remover(T item): bool
  + obtenerTodos(): List<T>
  + obtenerPrimero(): T?
  + obtenerUltimo(): T?
  + cantidad(): int
  + vaciar(): void
  + filtrar(predicado Function(T): bool): List<T>
  + mapear<U>(mapper Function(T): U): List<U>
}
```

---

### 8. Clase Hotel (OBLIGATORIO)
Gestiona el hotel completo:

#### Propiedades:
```dart
- nombre: String
- ubicacion: String
- habitaciones: Caja<Habitacion>    // Genérico
- reservas: Caja<Reserva>           // Genérico
- observadores: List<ObservadorReserva>
- static hotelesTotales: int
```

#### Métodos requeridos:
```dart
+ Hotel(nombre, ubicacion)
+ agregarHabitacion(Habitacion): void
+ buscarHabitacion(numero): Habitacion?
+ obtenerHabitacionesDisponibles(rango, tipo): List<Habitacion>
+ crearReserva(habitacion, cliente, rango, personas, notas): Reserva?
+ obtenerReserva(numeroReserva): Reserva?
+ listarReservasPorCliente(cliente): List<Reserva>
+ listarReservasEnFecha(fecha): List<Reserva>
+ cancelarReserva(numeroReserva): bool
+ registrarObservador(observador): void
+ notificarObservadores(reserva, evento): void (privado)
+ obtenerOcupacionPromedio(): double  // % de ocupación
+ obtenerIngresosTotales(): double
+ obtenerReporte(): String
```

#### Lógica de disponibilidad:
- Una habitación está disponible para un rango si NO tiene reservas confirmadas en esas fechas
- Ignorar reservas canceladas para cálculo de disponibilidad
- Reservas pendientes NO ocupan la habitación

---

### 9. Clases Observadoras Concretas (OBLIGATORIO)

#### RegistroHotel : ObservadorReserva
```dart
- registro: List<String>
+ notificarCambio(reserva, evento): void  // Guardar en log
+ obtenerRegistroCompleto(): String
```

#### GestorNotificaciones : ObservadorReserva
```dart
+ notificarCambio(reserva, evento): void
  // Simular envío de mensajes al cliente
  // Ej: "✉️ Reserva confirmada! Número: RES-001"
```

---

## Caso de Uso - Ejemplo de Ejecución

```dart
void main() {
  // Crear hotel
  var hotel = Hotel('Grand Hotel', 'Madrid');
  
  // Crear observadores
  var registro = RegistroHotel();
  var notificador = GestorNotificaciones();
  hotel.registrarObservador(registro);
  hotel.registrarObservador(notificador);
  
  // Crear habitaciones
  var tarifa1 = Tarifa(TipoHabitacion.doble, 100, 150, 70);
  var hab1 = Habitacion(101, TipoHabitacion.doble, tarifa1, 2, 
                        ['WiFi', 'Aire Acondicionado']);
  
  hotel.agregarHabitacion(hab1);
  
  // Crear rango de fechas
  var rango = RangoFechas(DateTime(2026, 2, 1), DateTime(2026, 2, 5));
  
  // Crear reserva
  var reserva = hotel.crearReserva(hab1, 'Juan Pérez', rango, 2, 'Nada especial');
  
  if (reserva != null) {
    print(reserva.obtenerResumen());
    reserva.confirmar();
    reserva.realizarCheckin(DateTime(2026, 2, 1));
  }
  
  // Mostrar reporte
  print(hotel.obtenerReporte());
  print(registro.obtenerRegistroCompleto());
}
```

---

## Requisitos Especiales

### Validaciones obligatorias:
- ✓ Fechas válidas (inicio < fin)
- ✓ No permitir reservas en habitaciones no disponibles
- ✓ No más personas que capacidad
- ✓ Cambios de estado coherentes
- ✓ IVA 21% en cálculo de precios totales

### Encapsulación:
- Uso extensivo de getters/setters con validaciones
- Métodos privados para lógica interna
- Control de acceso a listas mediante métodos

### Genéricos:
- Usar `Caja<T>` para habitaciones y reservas
- Aprovechar métodos de filtrado genéricos
- Demostrar ventajas de type-safe collections

### Patrón Observer:
- Implementar interface `ObservadorReserva`
- Notificar a todos los observadores en eventos importantes
- Mínimo 2 implementaciones concretas

### Cálculos complejos:
- Tarifa dinámica según temporada
- Precio total basado en suma de días
- IVA calculado correctamente
- Ocupación promedio

---

## Evaluación (100 puntos)

| Criterio | Puntos | Detalles |
|----------|--------|----------|
| **Estructuras de datos** | 20 | RangoFechas, Tarifa, Reserva, Habitacion, Hotel (5 clases) |
| **Genéricos** | 15 | Caja<T> implementada correctamente con métodos T-safe |
| **Patrón Observer** | 15 | Interface + 2 implementaciones, notificaciones funcionales |
| **Cálculos y lógica** | 20 | Tarifas por temporada, precios correctos, disponibilidad exacta |
| **Validaciones** | 15 | Fechas, capacidad, estados, disponibilidad |
| **Métodos requeridos** | 10 | Todos implementados y funcionales |
| **Código limpio** | 5 | Nombres significativos, comentarios claros |

---

## Desafíos Bonus (Puntos Extra)

### 1. Descuentos por duración (3 pts)
- >7 noches: -10%
- >14 noches: -15%

### 2. Precios dinámicos (4 pts)
En `Tarifa`, considerando también ocupación actual del hotel:
- Si ocupación > 80%: precio +20%
- Si ocupación < 20%: precio -15%

### 3. Historial de cambios (2 pts)
En `Reserva`, guardar cada cambio de estado con timestamp.

### 4. Búsqueda avanzada (3 pts)
En `Hotel`:
```dart
buscarHabitacionesPorCriterios(
  tipo: TipoHabitacion?,
  precioMin: double?,
  precioMax: double?,
  servicios: List<String>?
): List<Habitacion>
```

### 5. Reportes por rango (3 pts)
En `Hotel`:
```dart
obtenerReportePorFechas(inicio, fin): String
// Mostrar ingresos y ocupación en ese período
```

### 6. Cancelación con reembolso (2 pts)
Implementar política de reembolso:
- Cancelación 7+ días antes: 100%
- Cancelación 3-6 días antes: 50%
- Cancelación < 3 días: 0%

---

## Notas de implementación

### DateTime:
```dart
// Crear fecha
var fecha = DateTime(2026, 2, 1);

// Comparar
if (fecha1.isBefore(fecha2)) { }
if (fecha1.isAfter(fecha2)) { }

// Calcular diferencia
var dias = fecha2.difference(fecha1).inDays;

// Sumar días
var manana = fecha.add(Duration(days: 1));
```

### Formato de salida:
- Usar tablas con caracteres especiales (╔╗╠╣╚╝═║)
- Precios con `.toStringAsFixed(2)`
- Fechas: `"${fecha.year}-${fecha.month.toString().padLeft(2, '0')}-..."`

### Tips:
- Implementar `toString()` en clases para debugging
- Usar `try-catch` para búsquedas con `firstWhere()`
- Considerar métodos `private` (comienzan con `_`)
- Genéricos `<T>` deben ser cohesivos dentro de una clase

