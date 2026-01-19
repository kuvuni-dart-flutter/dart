# 📋 Ejercicios - Ejemplo 3_1: Estructuras de Control Básicas

## Nivel: Medio

---

## Ejercicio 1: Sistema de Calificaciones con Estadísticas

### 📝 Enunciado
Crea un programa que solicite 5 notas de estudiantes (usa una lista predefinida) y:
1. Calcule la nota media
2. Muestre cuántos aprobados (>=5) y cuántos suspensos (<5) hay
3. Muestre la nota más alta y la más baja
4. Clasifique cada nota usando if-else if-else en: Sobresaliente (>=9), Notable (>=7), Aprobado (>=5), Suspenso (<5)

### 🎯 Salida Esperada 
```
╔══════════════════════════════════════╗
║  SISTEMA DE CALIFICACIONES           ║
╚══════════════════════════════════════╝

📊 Notas ingresadas: [7, 4, 9, 6, 8]

📈 ESTADÍSTICAS:
✓ Nota media: 6.8
✓ Aprobados: 4
✓ Suspensos: 1
✓ Nota más alta: 9
✓ Nota más baja: 4

📚 CLASIFICACIÓN POR NOTAS:
Nota 7 → 📖 Notable
Nota 4 → 📕 Suspenso
Nota 9 → 📚 Sobresaliente
Nota 6 → 📝 Aprobado
Nota 8 → 📖 Notable
```

⏱️ **Tiempo estimado:** 15-20 minutos

---

## Ejercicio 2: Calculadora de Días del Mes

### 📝 Enunciado
Crea un programa que, dado un número de mes (1-12) y un año:
1. Determine cuántos días tiene ese mes
2. Considere los años bisiestos para febrero (un año es bisiesto si es divisible por 4, excepto los divisibles por 100, salvo que también sean divisibles por 400)
3. Valide que el mes esté en el rango 1-12, si no, muestre un error

**Casos de prueba:**
- Mes 2, Año 2024 → 29 días (bisiesto)
- Mes 2, Año 2023 → 28 días (no bisiesto)
- Mes 4, Año 2024 → 30 días
- Mes 13, Año 2024 → Error

### 🎯 Salida Esperada
```
╔══════════════════════════════════════╗
║  CALCULADORA DE DÍAS DEL MES         ║
╚══════════════════════════════════════╝

📅 Mes: 2, Año: 2024
✓ El mes 2 del año 2024 tiene 29 días
ℹ️ 2024 es un año bisiesto

📅 Mes: 2, Año: 2023
✓ El mes 2 del año 2023 tiene 28 días

📅 Mes: 4, Año: 2024
✓ El mes 4 del año 2024 tiene 30 días

📅 Mes: 13, Año: 2024
❌ Error: Mes inválido. Debe estar entre 1 y 12
```

⏱️ **Tiempo estimado:** 20-25 minutos

---

## Ejercicio 3: Generador de Tabla de Multiplicar Personalizada

### 📝 Enunciado
Crea un programa que:
1. Genere la tabla de multiplicar de un número (por ejemplo, el 7)
2. Permita elegir desde qué número empieza (por ejemplo, desde 3) y hasta qué número termina (por ejemplo, hasta 10)
3. Calcule la suma total de todos los resultados
4. Muestre solo los resultados pares (usa `continue` para saltar los impares)

**Parámetros de prueba:** 
- Número: 7
- Desde: 3
- Hasta: 10

### 🎯 Salida Esperada
```
╔══════════════════════════════════════╗
║  TABLA DE MULTIPLICAR DEL 7          ║
║  Desde 3 hasta 10                    ║
╚══════════════════════════════════════╝

📊 RESULTADOS PARES:
7 × 4 = 28
7 × 6 = 42
7 × 8 = 56
7 × 10 = 70

🧮 Suma total de resultados pares: 196
```

⏱️ **Tiempo estimado:** 15-20 minutos

---

## Ejercicio 4: Sistema de Validación de Contraseñas

### 📝 Enunciado
Crea un programa que valide una contraseña según los siguientes criterios:
1. Debe tener al menos 8 caracteres de longitud
2. Debe contener al menos una letra mayúscula
3. Debe contener al menos un número
4. Debe contener al menos un carácter especial (!@#$%^&*)

El programa debe probar 5 contraseñas diferentes y mostrar:
- Si cada contraseña es válida o no
- Qué requisitos cumple y cuáles no
- Un contador de contraseñas válidas e inválidas

**Contraseñas de prueba:**
- "abc123"
- "Password1"
- "Pass@123"
- "secreta"
- "MiClave#99"

### 🎯 Salida Esperada
```
╔══════════════════════════════════════╗
║  VALIDADOR DE CONTRASEÑAS            ║
╚══════════════════════════════════════╝

🔐 Validando: "abc123"
❌ Longitud insuficiente (6 < 8)
❌ No contiene mayúsculas
✓ Contiene números
❌ No contiene caracteres especiales
→ CONTRASEÑA INVÁLIDA

🔐 Validando: "Password1"
✓ Longitud suficiente (9 >= 8)
✓ Contiene mayúsculas
✓ Contiene números
❌ No contiene caracteres especiales
→ CONTRASEÑA INVÁLIDA

🔐 Validando: "Pass@123"
✓ Longitud suficiente (8 >= 8)
✓ Contiene mayúsculas
✓ Contiene números
✓ Contiene caracteres especiales
→ ✅ CONTRASEÑA VÁLIDA

🔐 Validando: "secreta"
❌ Longitud insuficiente (7 < 8)
❌ No contiene mayúsculas
❌ No contiene números
❌ No contiene caracteres especiales
→ CONTRASEÑA INVÁLIDA

🔐 Validando: "MiClave#99"
✓ Longitud suficiente (10 >= 8)
✓ Contiene mayúsculas
✓ Contiene números
✓ Contiene caracteres especiales
→ ✅ CONTRASEÑA VÁLIDA

═══════════════════════════════════════
📊 RESUMEN:
✅ Contraseñas válidas: 2
❌ Contraseñas inválidas: 3
```

⏱️ **Tiempo estimado:** 25-30 minutos

---

## 💡 Consejos

- Usa bucles `for` para iterar sobre listas
- Usa `if-else` para validaciones
- Usa `while` cuando no sepas cuántas iteraciones necesitas
- Recuerda usar `break` para salir de un bucle
- Usa `continue` para saltar a la siguiente iteración
- Para verificar si una letra es mayúscula: `letra == letra.toUpperCase() && letra != letra.toLowerCase()`
- Para verificar si un carácter es un número: `int.tryParse(caracter) != null`
