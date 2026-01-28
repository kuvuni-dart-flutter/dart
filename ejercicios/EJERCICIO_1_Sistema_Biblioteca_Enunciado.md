# 📚 EJERCICIO 1: SISTEMA DE GESTIÓN DE BIBLIOTECA

**Nivel:** Medio  
**Conceptos:** Herencia, Composición, Polimorfismo  
**Tiempo estimado:** 60 minutos

---

## 📋 Descripción

Debes crear un sistema para gestionar una biblioteca con libros y revistas.

## 🎯 Requisitos

### 1. Clase Base: Publicación (Abstracta)
Crea una clase abstracta `Publicacion` con:
- **Propiedades:**
  - `titulo` (String)
  - `autor` (String)
  - `anioPublicacion` (int)
  - `disponible` (bool, privada con getter/setter)

- **Métodos:**
  - Método abstracto: `obtenerTipoMaterial()` → String
  - Método abstracto: `calcularDiasPrestamo()` → int
  - Método concreto: `prestar()` → bool (cambia disponible a false)
  - Método concreto: `devolver()` → void (cambia disponible a true)
  - Método concreto: `obtenerInfo()` → String

### 2. Clase: Libro (Extiende Publicacion)
- **Propiedades adicionales:**
  - `numeroPaginas` (int)
  - `genero` (String: "Ficción", "No Ficción", "Infantil")

- **Métodos:**
  - `obtenerTipoMaterial()` → retorna "Libro"
  - `calcularDiasPrestamo()` → retorna 14 días
  - `obtenerInfo()` → String con todos los detalles

### 3. Clase: Revista (Extiende Publicacion)
- **Propiedades adicionales:**
  - `numero` (int) - número de revista
  - `temaMensual` (String)

- **Métodos:**
  - `obtenerTipoMaterial()` → retorna "Revista"
  - `calcularDiasPrestamo()` → retorna 7 días
  - `obtenerInfo()` → String con todos los detalles

### 4. Clase: Biblioteca
- **Propiedades:**
  - `nombre` (String)
  - `publicaciones` (List<Publicacion>)

- **Métodos:**
  - `agregarPublicacion(Publicacion p)` → void
  - `prestarPublicacion(String titulo)` → bool (busca por título)
  - `devolverPublicacion(String titulo)` → void
  - `obtenerDisponibles()` → List<Publicacion> (solo disponibles)
  - `obtenerNoDisponibles()` → List<Publicacion> (solo prestados)
  - `mostrarCatalogo()` → void (muestra todas las publicaciones)
  - `obtenerEstadisticas()` → String (total, disponibles, prestados)

---

## ✅ Requisitos Especiales

1. **Validaciones:**
   - No se puede prestar un libro que ya está prestado
   - El título debe buscarse (case-insensitive)
   - La biblioteca no puede estar vacía

2. **Polimorfismo:**
   - `calcularDiasPrestamo()` debe retornar diferente según el tipo
   - Usa listas polimórficas (List<Publicacion>)

3. **Encapsulación:**
   - `disponible` debe ser privada
   - Usa getter/setter con validación

---

## 🧪 Pruebas Esperadas (Ejemplo main())

```dart
void main() {
  var biblioteca = Biblioteca('Biblioteca Municipal');
  
  // Agregar publicaciones
  biblioteca.agregarPublicacion(
    Libro('1984', 'George Orwell', 1949, 328, 'Ficción')
  );
  biblioteca.agregarPublicacion(
    Revista('National Geographic', 'Desconocido', 2024, 45, 'Naturaleza')
  );
  
  // Ver catálogo
  biblioteca.mostrarCatalogo();
  
  // Prestar
  biblioteca.prestarPublicacion('1984');
  
  // Ver estadísticas
  print(biblioteca.obtenerEstadisticas());
}
```

---

## 📊 Criterios de Evaluación

| Criterio | Puntos |
|----------|--------|
| Estructura de clases correcta | 25 |
| Herencia implementada | 25 |
| Métodos funcionan correctamente | 25 |
| Validaciones | 15 |
| Código limpio y documentado | 10 |
| **TOTAL** | **100** |

---

## 💡 Pistas

1. Define bien la clase abstracta `Publicacion` como base
2. Usa `super()` en constructores de subclases
3. Busca publicaciones con `where()` en la lista
4. Usa `@override` para los métodos polimórficos
5. Valida que la publicación existe antes de prestarla

---

## 🚀 Desafío Extra (Bonus)

Si terminas rápido:
- Agrega una clase `Usuario` que lleve registro de qué libros ha prestado
- Implementa un sistema de multas (si se atrasa en devolver)
- Agrega un método para buscar por autor o género

