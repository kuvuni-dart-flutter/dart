# EJERCICIO 3: SISTEMA DE TIENDA ONLINE
## Nivel: AVANZADO

### Objetivo
Implementar un sistema de gestión de tienda online que maneje productos, carritos de compra, categorías y ordenes. Este ejercicio enfatiza **composición, enumeraciones, métodos estáticos y cálculos complejos**.

---

## Requisitos del Sistema

### 1. Enum de Categorías (OBLIGATORIO)
Crear un enum `Categoria` con al menos las siguientes opciones:
- `electronica`
- `ropa`
- `libros`
- `hogar`
- `deportes`

**Nota:** Cada categoría puede tener un descuento base diferente.

---

### 2. Clase Producto (OBLIGATORIO)
Debe contener:

#### Propiedades (privadas excepto donde se indique):
```dart
- nombre: String
- id: String (único)
- precio: double (solo positivo)
- stock: int (solo no negativo)
- categoria: Categoria
- descripcion: String
```

#### Métodos requeridos:
```dart
+ Producto(nombre, id, precio, stock, categoria, descripcion)
+ obtenerInfo(): String          // Retorna info formateada
+ actualizarStock(cantidad): bool // Retorna true/false según disponibilidad
+ aplicarDescuento(porcentaje): double  // Retorna precio con descuento
+ reducirPrecio(monto): void     // Reduce el precio en monto fijo
```

#### Métodos adicionales sugeridos:
- `estaDisponible(): bool` - Verifica si hay stock
- `obtenerDetalles(): String` - Info completa con stock actual
- `compararConProducto(Producto): bool` - Compara por precio

---

### 3. Clase ElementoCarrito (OBLIGATORIO)
Representa un producto en el carrito:

#### Propiedades:
```dart
- producto: Producto
- cantidad: int (mínimo 1, máximo según stock)
```

#### Métodos requeridos:
```dart
+ ElementoCarrito(producto, cantidad)
+ obtenerSubtotal(): double
+ aumentarCantidad(cantidad): bool  // Respeta stock disponible
+ reducirCantidad(cantidad): bool   // No puede ser menor a 1
```

---

### 4. Clase CarritoDeCompra (OBLIGATORIO)
Gestiona múltiples elementos:

#### Propiedades:
```dart
- elementos: List<ElementoCarrito>
- fechaCreacion: DateTime
- cliente: String (identificación del cliente)
```

#### Métodos requeridos:
```dart
+ CarritoDeCompra(cliente)
+ agregarProducto(Producto, cantidad): void
+ eliminarProducto(idProducto): bool
+ vaciarCarrito(): void
+ obtenerTotal(): double
+ obtenerSubtotalConIVA(): double  // IVA 21%
+ aplicarCodigoDescuento(codigo): bool  // Ver códigos válidos abajo
+ mostrarCarrito(): void  // Imprime contenido formateado
```

#### Códigos de Descuento Válidos (estáticos):
- `"DESCUENTO10"` → 10% de descuento
- `"DESCUENTO20"` → 20% de descuento
- `"ENVIO"` → 5€ de descuento
- Solo se puede aplicar UN código por carrito
- El descuento nunca puede ser negativo

---

### 5. Clase Orden (OBLIGATORIO)
Representa una compra realizada:

#### Propiedades:
```dart
- numeroOrden: String (autogenerado: "ORD-001", "ORD-002", etc.)
- carrito: CarritoDeCompra
- estado: EstadoOrden (enum)
- fecha: DateTime
- total: double
```

#### Enum EstadoOrden:
```dart
enum EstadoOrden { pendiente, procesando, enviado, entregado, cancelado }
```

#### Métodos requeridos:
```dart
+ Orden(carrito)
+ cambiarEstado(nuevoEstado): void
+ obtenerResumen(): String  // Retorna orden completa formateada
+ cancelar(): bool  // Solo si estado es "pendiente"
+ obtenerTotalEnvio(): double  // Retorna costo de envío
```

#### Reglas de Envío (método estático):
- Gratuito si total > 50€
- 5€ si total está entre 20€ y 50€
- 10€ si total < 20€

---

### 6. Clase TiendaOnline (OBLIGATORIO)
Gestiona toda la tienda:

#### Propiedades:
```dart
- nombre: String
- productos: List<Producto>
- ordenes: List<Orden>
- static totalOrdenes: int  // Contador global
```

#### Métodos requeridos:
```dart
+ TiendaOnline(nombre)
+ agregarProducto(Producto): void
+ eliminarProducto(idProducto): bool
+ buscarProductoPorId(id): Producto?
+ buscarProductosPorCategoria(Categoria): List<Producto>
+ buscarProductosPorPrecio(min, max): List<Producto>
+ obtenerProductosEnStock(): List<Producto>
+ crearOrden(carrito): Orden
+ obtenerOrdenPorNumero(numero): Orden?
+ mostrarInventario(): void  // Imprime stock actual
+ obtenerReporteVentas(): String  // Total vendido, órdenes entregadas, etc.
```

---

## Caso de Uso - Ejemplo de Ejecución

```dart
void main() {
  // Crear tienda
  var tienda = TiendaOnline('MegaTienda Online');
  
  // Crear productos
  var laptop = Producto('Laptop ASUS', 'P001', 1200.00, 5, 
                       Categoria.electronica, 'Laptop 15.6 pulgadas');
  var camisa = Producto('Camisa Azul', 'P002', 45.00, 20, 
                       Categoria.ropa, 'Camisa 100% algodón');
  var libro = Producto('Clean Code', 'P003', 35.00, 15, 
                      Categoria.libros, 'Guía de desarrollo');
  
  // Agregar a tienda
  tienda.agregarProducto(laptop);
  tienda.agregarProducto(camisa);
  tienda.agregarProducto(libro);
  
  // Cliente crea carrito
  var carrito = CarritoDeCompra('Cliente_123');
  carrito.agregarProducto(laptop, 1);
  carrito.agregarProducto(camisa, 2);
  carrito.agregarProducto(libro, 3);
  
  // Aplicar descuento
  carrito.aplicarCodigoDescuento('DESCUENTO10');
  carrito.mostrarCarrito();
  
  // Crear orden
  var orden = tienda.crearOrden(carrito);
  print(orden.obtenerResumen());
  
  // Cambiar estado
  orden.cambiarEstado(EstadoOrden.enviado);
  
  // Reporte
  print(tienda.obtenerReporteVentas());
}
```

---

## Requisitos Especiales

### Validaciones obligatorias:
- ✓ No permitir agregar producto con ID duplicado
- ✓ No permitir cantidades negativas en el carrito
- ✓ No permitir aplicar código de descuento si el carrito está vacío
- ✓ Respetar límites de stock disponible
- ✓ Calcular correctamente IVA (21%)

### Encapsulación:
- Todas las propiedades deben ser privadas excepto las necesarias
- Getters y setters con validaciones donde sea apropiado
- No permitir acceso directo a listas internas (usar métodos)

### Métodos estáticos:
- Contador de órdenes (`Orden.totalOrdenes`)
- Códigos de descuento válidos
- Cálculo de envío según monto

### Polimorfismo (Bonus):
- Si agregaste métodos como `obtenerInfo()` a Producto, implementa una interfaz o clase abstracta `ArticuloTienda`

---

## Evaluación (100 puntos)

| Criterio | Puntos | Detalles |
|----------|--------|----------|
| **Estructura de clases** | 25 | 6 clases/enums (Producto, ElementoCarrito, CarritoDeCompra, Orden, TiendaOnline + EstadoOrden/Categoria) |
| **Composición** | 20 | Relaciones correctas entre clases, gestión de listas, uso de composición |
| **Cálculos** | 20 | Descuentos, IVA, envío, totales calculados correctamente |
| **Validaciones** | 15 | Stock, cantidades, ID únicos, códigos de descuento, estados de orden |
| **Métodos requeridos** | 15 | Todos los métodos especificados implementados y funcionales |
| **Código limpio** | 5 | Nombres significativos, indentación, comentarios donde sea necesario |

---

## Desafíos Bonus (Puntos Extra)

### 1. Historial de cambios de estado (2 pts)
Guardar en Orden todos los cambios de estado con timestamps.

### 2. Método de búsqueda avanzada (3 pts)
En TiendaOnline, método que busque productos por **múltiples criterios** (nombre contiene, categoría, rango de precio).

### 3. Carrito persistente (2 pts)
Que el carrito recuerde los últimos productos (sin cantidades) para la próxima sesión.

### 4. Reporte de productos más vendidos (3 pts)
En TiendaOnline, método que retorne productos ordenados por cantidad vendida.

### 5. Restricción de descuentos (2 pts)
Solo permitir descuentos en ciertos tipos de productos (ej: no en electrónica).

---

## Notas de implementación

- **DateTime:** Usa `DateTime.now()` para timestamps
- **Formato de números:** Usa `.toStringAsFixed(2)` para precios
- **Formato de salida:** Considera usar caracteres especiales para tablas (╔╗╠╣╚╝═║)
- **Métodos toString():** Considera implementar para debugging
- **Errores:** Captura excepciones donde sea apropiado (búsquedas, cálculos)

