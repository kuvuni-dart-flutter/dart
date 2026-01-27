# Ejercicios Avanzados - Funciones en Dart

**Autor:** Julián González  
**Curso:** Dart - Getafe 2026  
**Tema:** Funciones avanzadas, closures, recursión y funciones de orden superior

---

## 📋 Instrucciones Generales

- Incluye ejemplos de invocación en un `main()` para demostrar el funcionamiento
- Documenta tu código con comentarios claros

---

## 🎯 Ejercicio 1: Contador 

### Descripción
Implementa una función `crearContador()` que retorne un closure que mantenga un contador interno.

### Requisitos
1. La función `crearContador()` debe:
   - Retornar un Map con funciones que actúan como métodos
   - Mantener una variable contador que empiece en 0
   - Incluir las siguientes operaciones:
     - `incrementar()`: suma 1 al contador y retorna el nuevo valor
     - `decrementar()`: resta 1 al contador y retorna el nuevo valor
     - `obtenerValor()`: retorna el valor actual sin modificarlo
     - `reiniciar()`: pone el contador en 0
     - `sumar(n)`: suma n al contador

2. El closure debe "capturar" la variable contador
3. Cada llamada a `crearContador()` debe crear un contador independiente

### Ejemplo de uso esperado
```dart
var contador1 = crearContador();
print(contador1['incrementar']());  // 1
print(contador1['incrementar']());  // 2
print(contador1['sumar'](5));       // 7
print(contador1['obtenerValor']());  // 7

// Contador independiente
var contador2 = crearContador();
print(contador2['incrementar']());  // 1
print(contador1['obtenerValor']());  // 7 (no ha cambiado)

contador1['reiniciar']();
print(contador1['obtenerValor']());  // 0
```

### Conceptos a demostrar
- Closures y captura de variables
- Funciones que retornan Maps de funciones
- Independencia entre closures

---

## 🎯 Ejercicio 2: Procesador de listas con funciones de orden superior 

### Descripción
Crea un conjunto de funciones de orden superior que procesen listas aplicando transformaciones, filtros y reducciones.

### Requisitos
1. Implementa las siguientes funciones:
   - `aplicarOperacion(lista, operacion)`: aplica una función a cada elemento y retorna la lista transformada
   - `filtrarPor(lista, condicion)`: filtra elementos que cumplan una condición
   - `combinarElementos(lista, combinador)`: reduce la lista a un solo valor usando una función combinadora

2. Las funciones deben aceptar otras funciones como parámetros
3. Implementa al menos 5 funciones auxiliares útiles:
   - `esPar(n)`: verifica si un número es par
   - `duplicar(n)`: multiplica por 2
   - `sumarTodos(a, b)`: suma dos números (para el combinador)
   - Y al menos 2 funciones más de tu elección

### Ejemplo de uso esperado
```dart
var numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

// Aplicar operación
var duplicados = aplicarOperacion(numeros, duplicar);
print(duplicados);  // [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

// Filtrar por condición
var pares = filtrarPor(numeros, esPar);
print(pares);  // [2, 4, 6, 8, 10]

// Combinar elementos
var suma = combinarElementos(numeros, sumarTodos);
print(suma);  // 55

// Procesar lista con múltiples operaciones
var resultado = procesarLista(numeros, [
  (lista) => filtrarPor(lista, esPar),
  (lista) => aplicarOperacion(lista, duplicar),
  (lista) => combinarElementos(lista, sumarTodos)
]);
print(resultado);  // 60 (suma de pares duplicados)
```

### Conceptos a demostrar
- Funciones de orden superior
- Funciones como parámetros
- Composición de operaciones
- Map, filter y reduce manual

---

