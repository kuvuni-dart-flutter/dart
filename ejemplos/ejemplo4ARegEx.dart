
// Ejemplos de uso de expresiones regulares en Dart
// Autor: Julián

// ===============================
// Ejemplos de patrones RegExp útiles:
//
// r"\d"         -> Un dígito (0-9)
// r"\D"         -> Un carácter que NO es dígito
// r"\w"         -> Un carácter de palabra (letra, número o _)
// r"\W"         -> Un carácter que NO es de palabra
// r"\s"         -> Un espacio en blanco (espacio, tabulación, salto de línea)
// r"\S"         -> Un carácter que NO es espacio en blanco
// r"."           -> Cualquier carácter excepto salto de línea
// r"^abc"       -> Empieza por 'abc'
// r"abc$"       -> Termina en 'abc'
// r"a|b"        -> 'a' o 'b'
// r"[abc]"      -> Cualquier carácter: 'a', 'b' o 'c'
// r"[^abc]"     -> Cualquier carácter excepto 'a', 'b' o 'c'
// r"[a-z]"      -> Cualquier letra minúscula
// r"[A-Z]"      -> Cualquier letra mayúscula
// r"[0-9]"      -> Cualquier dígito
// r"[a-zA-Z]"   -> Cualquier letra
// r"\bpalabra\b" -> Coincidencia exacta de la palabra
// r"(abc)+"     -> Una o más repeticiones de 'abc'
// r"a{3}"       -> Exactamente 3 'a'
// r"a{2,4}"     -> Entre 2 y 4 'a'
// r"(?i)abc"    -> Coincidencia sin distinguir mayúsculas/minúsculas
// r"(?<=@)\w+"  -> Palabra precedida por '@' (lookbehind)
// r"\w+(?=\.)" -> Palabra seguida de '.' (lookahead)
// r"^$"         -> Línea vacía
// r"^.*$"       -> Toda la línea
// r"\\"         -> Barra invertida (hay que escapar con doble barra)
//
// Puedes combinar estos patrones para crear validaciones complejas.
//
// Ejemplo de uso:
//   RegExp exp = RegExp(r"[A-Z]{2,4}\d{3}"); // 2-4 mayúsculas seguidas de 3 dígitos
//   print(exp.hasMatch("ABCD123")); // true
// ===============================

void main() {
	// 1. Comprobar si un texto contiene números
	String texto1 = "Hola mundo 2026";
	RegExp regExp1 = RegExp(r"\d+"); // Busca uno o más dígitos
	bool contieneNumero = regExp1.hasMatch(texto1);
	print("¿Contiene número? $contieneNumero"); // true

	// 2. Extraer todas las coincidencias de números
	String texto2 = "Mi teléfono es 123-456-7890 y mi código es 2026";
	RegExp regExp2 = RegExp(r"\d{3,}"); // Números de 3 o más cifras
	// Usamos allMatches para obtener todas las coincidencias de la expresión regular en el texto.
	// allMatches devuelve un Iterable de objetos Match.
	// Cada Match representa una coincidencia encontrada y contiene:
	//   - match.group(0): el texto que coincide con el patrón completo
	//   - match.start: posición inicial de la coincidencia
	//   - match.end: posición final de la coincidencia
	//   - Si la expresión tiene grupos (paréntesis), match.group(n) devuelve el grupo n
	Iterable<Match> coincidencias = regExp2.allMatches(texto2);
  print("Coindencias encontradas: ${coincidencias.length}");
	print("Números encontrados:");
	for (var match in coincidencias) {
		// Mostramos el texto que coincide con el patrón (en este caso, números de 3 o más cifras)
		print(match.group(0));
		// Puedes acceder a más información, por ejemplo:
		// print('Empieza en: \\${match.start}, termina en: \\${match.end}');
	}

	// 3. Reemplazar emails por [oculto]
	String texto3 = "Correo: ejemplo@correo.com";
	String oculto = texto3.replaceAll(RegExp(r"\w+@\w+\.\w+"), "[oculto]");
	print(oculto); // Correo: [oculto]

	// 4. Validar formato de email
	String email = "usuario@dominio.com";
	RegExp regExpEmail = RegExp(r"^[\w\.-]+@[\w\.-]+\.\w+$");
	if (regExpEmail.hasMatch(email)) {
		print("Email válido");
	} else {
		print("Email inválido");
	}

	// 5. Reemplazar todos los caracteres especiales por una cadena vacía
	String textoConEspeciales = "¡Hola, mundo! ¿Cómo estás? Ú É é #Dart_2026.";
	// [^\w\s] significa: cualquier carácter que NO sea letra, número o espacio (no incluídas las letras acentuadas)
	// [^a-zA-Z0-9\s] significa: cualquier carácter que NO sea letra, número o espacio (elimina también el guión bajo)
	String soloLetrasYNumerosSinGuionBajo = textoConEspeciales.replaceAll(RegExp(r"[^a-zA-Z0-9á-úÁ-Ú\s]"), "");

	print(soloLetrasYNumerosSinGuionBajo); // Hola mundo Cómo estás Dart2026

	// 6. Explicación breve:
	// - RegExp(r"patrón") crea una expresión regular.
	// - hasMatch verifica si hay coincidencia.
	// - allMatches devuelve todas las coincidencias.
	// - replaceAll reemplaza coincidencias por otro texto.
}