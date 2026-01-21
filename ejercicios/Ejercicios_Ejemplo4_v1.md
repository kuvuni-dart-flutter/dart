
# Ejercicios de listas en Dart

A continuación tienes varios ejercicios para practicar el uso de listas en Dart. Los dos últimos opcionales. Cada ejercicio está pensado para durar "x" minutos y fomentar el razonamiento, la entrada de datos por consola y la práctica avanzada.

---

## Ejercicio 1: Gestión de notas de estudiantes

Crea un programa en Dart que permita:
- Solicitar por consola el número de estudiantes y sus nombres.
- Para cada estudiante, pedir por consola su nombre y sus notas (mínimo 5, máximo 10, validar entrada).
- Calcular y mostrar por pantalla para cada estudiante:
	- Nota media
	- Nota más alta y más baja
	- Desviación estándar (medida estadística que indica cuánto se dispersan o se alejan los valores de un conjunto de datos respecto a su media). Fórmula -> Investiga.
- Mostrar un ranking de estudiantes ordenado por nota media descendente.
- Mostrar el estudiante con la nota media más alta y el de mayor desviación estándar.

**Pistas:**
- Usa métodos como `forEach`, `map`, `reduce`, y funciones estadísticas.
- Puedes usar una lista de nombres para asociar cada sublista de notas a un estudiante.

---

## Ejercicio 2 (Juego): Adivina la palabra

Crea un juego de consola en Dart donde el usuario debe adivinar una palabra secreta.
- El programa debe permitir seleccionar una categoría de palabras antes de empezar (por ejemplo: frutas, oficios, países, animales, objetos, deportes, colores, ciudades, plantas, instrumentos musicales).
- Cada categoría tiene una lista de palabras (puedes completarlas o ampliarlas según tu preferencia; aquí se muestra el formato y algunos ejemplos, también al final del archivo):

```dart
// Ejemplo de listas de palabras por categoría 
List<String> frutas = [
	'manzana', 'plátano', 'naranja', 'pera', 'uva', 'sandía', 'melón', 'kiwi', 'fresa', 'cereza',
	'mango', 'papaya', 'piña', 'limón', 'mandarina', 'granada', 'albaricoque', 'melocotón', 'ciruela', 'frambuesa',
	// ... Ejemplo de lista en la parte inferior del archivo.
];
List<String> oficios = [
	'carpintero', 'panadero', 'médico', 'profesor', 'ingeniero', 'abogado', 'electricista', 'fontanero', 'pintor', 'jardinero',
	'bombero', 'policía', 'enfermero', 'veterinario', 'arquitecto', 'soldador', 'cocinero', 'periodista', 'actor', 'cantante',
	// 
];
List<String> paises = [
	'España', 'Francia', 'Italia', 'Alemania', 'Portugal', 'Argentina', 'Brasil', 'Chile', 'México', 'Colombia',
	'Perú', 'Venezuela', 'Uruguay', 'Paraguay', 'Bolivia', 'Ecuador', 'Estados Unidos', 'Canadá', 'China', 'Japón',
	// 
];
// Puedes crear listas similares para animales, objetos, deportes, colores, ciudades, plantas, instrumentos musicales, etc.
```

- El usuario elige la categoría y el programa selecciona una palabra secreta al azar de esa lista.
- El usuario tiene un número limitado de intentos para adivinar la palabra.
- En cada intento, el usuario introduce una palabra por consola:
	- Si la palabra coincide, gana el juego.
	- Si no, el programa muestra cuántas letras están en la posición correcta y cuántas letras correctas pero en posición incorrecta.
- Al finalizar los intentos, muestra la palabra secreta y el historial de intentos del usuario.

**Pistas:**
- Utiliza listas para almacenar las palabras y el historial de intentos.
- Usa métodos como `contains`, comparaciones de listas y manipulación de strings.
- Puedes mejorar el juego añadiendo niveles de dificultad, pistas extra o ampliando las categorías.


## Ejercicio 3 (Opcional): Manipulación avanzada de listas

Desarrolla un programa que:
- Solicite por consola la cantidad de números a generar y el rango mínimo/máximo.
- Genere la lista de números aleatorios según los datos introducidos.
- Solicite por consola un número y elimine todos los múltiplos de ese número de la lista.
- Ordene la lista resultante de mayor a menor.
- Busque y muestre todas las secuencias de al menos 3 números consecutivos crecientes dentro de la lista.
- Calcule y muestre:
	- El porcentaje de números mayores que la media
- Muestre el tercer y el quinto elemento de la lista ordenada (si existen).

**Pistas:**
- Utiliza `List.generate`, `removeWhere`, `sort`, y métodos de estadística.
- Usa bucles y condiciones para buscar secuencias crecientes.

---

## Ejercicio 4 (Opcional): Listas anidadas y operaciones complejas

Crea una lista de listas que represente una matriz de enteros de NxM (solicita N y M por consola).
- Llena la matriz con números aleatorios entre un mínimo y máximo introducido por consola.
- Calcula y muestra:
	- La suma y el producto de cada fila y columna
	- La fila y la columna con mayor y menor suma
	- El valor máximo y mínimo de toda la matriz y su posición
- Permite al usuario buscar un número en la matriz y mostrar todas sus posiciones.
- Realiza la transposición de la matriz y muéstrala por pantalla.

**Pistas:**
- Utiliza bucles anidados, métodos como `reduce`, y manipulación de listas.
- Usa validaciones de entrada y funciones auxiliares para operaciones complejas.

---


**Listas**

List<String> frutas = [
	'manzana', 'plátano', 'naranja', 'pera', 'uva', 'sandía', 'melón', 'kiwi', 'fresa', 'cereza',
	'mango', 'papaya', 'piña', 'limón', 'mandarina', 'granada', 'albaricoque', 'melocotón', 'ciruela', 'frambuesa',
	'arándano', 'guayaba', 'lichi', 'pomelo', 'tamarindo', 'coco', 'aguacate', 'chirimoya', 'dátil', 'higo',
	'nectarina', 'zarzamora', 'mora', 'carambola', 'caqui', 'maracuyá', 'grosella', 'membrillo', 'aceituna', 'azufaifo',
	'cacahuete', 'castaña', 'piñón', 'níspero', 'sapote', 'longan', 'rambután', 'mangostán', 'salak', 'camú camú',
	'jabuticaba', 'mirtilo', 'currant', 'bayas de goji', 'bayas de acai', 'tomate', 'pepino', 'calabaza', 'berenjena', 'pimiento',
	'chile', 'jalapeño', 'guindilla', 'tomatillo', 'chayote', 'yaca', 'durian', 'lucuma', 'feijoa', 'kiwano',
	'pitahaya', 'sapodilla', 'santol', 'langsat', 'mamey', 'mamoncillo', 'tuna', 'tuno', 'tuno indio', 'tuno blanco',
	'tuno rojo', 'tuno amarillo', 'tuno verde', 'tuno azul', 'tuno negro', 'tuno morado', 'tuno naranja', 'tuno rosa', 'tuno marrón', 'tuno gris',
	'tuno violeta', 'tuno celeste', 'tuno turquesa', 'tuno dorado', 'tuno plateado', 'tuno cobre', 'tuno bronce', 'tuno coral', 'tuno perla', 'tuno jade'
];
List<String> oficios = [
	'carpintero', 'panadero', 'médico', 'profesor', 'ingeniero', 'abogado', 'electricista', 'fontanero', 'pintor', 'jardinero',
	'bombero', 'policía', 'enfermero', 'veterinario', 'arquitecto', 'soldador', 'cocinero', 'periodista', 'actor', 'cantante',
	'bailarín', 'escritor', 'poeta', 'programador', 'analista', 'diseñador', 'fotógrafo', 'piloto', 'azafata', 'conductor',
	'repartidor', 'albañil', 'escultor', 'cerrajero', 'relojero', 'joyero', 'modista', 'sastre', 'zapatero', 'dependiente',
	'bibliotecario', 'químico', 'biólogo', 'geólogo', 'astrónomo', 'matemático', 'físico', 'psicólogo', 'psiquiatra', 'dentista',
	'optometrista', 'farmacéutico', 'radiólogo', 'cirujano', 'pediatra', 'ginecólogo', 'urólogo', 'nefrólogo', 'cardiólogo', 'dermatólogo',
	'oftalmólogo', 'otorrino', 'neurólogo', 'oncólogo', 'patólogo', 'forense', 'técnico', 'mecánico', 'tornero', 'fresador',
	'calderero', 'chapista', 'pescador', 'marinero', 'capitán', 'grumete', 'pastor', 'ganadero', 'agricultor', 'apicultor',
	'vendedor', 'comerciante', 'empresario', 'directivo', 'gerente', 'secretario', 'auxiliar', 'administrativo', 'contable', 'tesorero',
	'interventor', 'auditor', 'asesor', 'consultor', 'coach', 'entrenador', 'monitor', 'guía', 'animador', 'locutor'
];
List<String> paises = [
	'España', 'Francia', 'Italia', 'Alemania', 'Portugal', 'Argentina', 'Brasil', 'Chile', 'México', 'Colombia',
	'Perú', 'Venezuela', 'Uruguay', 'Paraguay', 'Bolivia', 'Ecuador', 'Estados Unidos', 'Canadá', 'China', 'Japón',
	'Corea', 'India', 'Rusia', 'Ucrania', 'Polonia', 'Grecia', 'Turquía', 'Egipto', 'Sudáfrica', 'Nigeria',
	'Marruecos', 'Argelia', 'Túnez', 'Libia', 'Senegal', 'Ghana', 'Etiopía', 'Sudán', 'Kenia', 'Uganda',
	'Australia', 'Nueva Zelanda', 'Indonesia', 'Malasia', 'Tailandia', 'Vietnam', 'Filipinas', 'Singapur', 'Pakistán', 'Bangladesh',
	'Irán', 'Irak', 'Arabia Saudita', 'Israel', 'Jordania', 'Siria', 'Líbano', 'Qatar', 'Emiratos Árabes', 'Omán',
	'Afganistán', 'Kazajistán', 'Uzbekistán', 'Turkmenistán', 'Kirguistán', 'Tayikistán', 'Mongolia', 'Camboya', 'Laos', 'Birmania',
	'Nepal', 'Bután', 'Maldivas', 'Sri Lanka', 'Papúa Nueva Guinea', 'Fiyi', 'Samoa', 'Tonga', 'Vanuatu', 'Islas Salomón',
	'Micronesia', 'Palaos', 'Islas Marshall', 'Nauru', 'Tuvalu', 'Kiribati', 'Timor Oriental', 'Brunéi', 'Macao', 'Hong Kong',
	'Taiwán', 'Corea del Norte', 'Corea del Sur', 'Georgia', 'Armenia', 'Azerbaiyán', 'Chipre', 'Malta', 'Andorra', 'Mónaco'
];
