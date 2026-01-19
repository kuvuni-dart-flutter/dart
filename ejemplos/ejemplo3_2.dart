void main() {
  //Swicth con expresiones
  String tipoVehiculo = "coche2";

  String mensaje = switch (tipoVehiculo) {
    'coche' => 'Vehículo de cuatro ruedas',
    'moto' => 'Vehículo de dos ruedas',
    'bici' => 'Vehículo sin motor',
    _ => 'Vehículo desconocido',
  };
  print(mensaje);

  //Switch con coincidencia de patrones

  dynamic valor = 0;
  switch (valor) {
    case int n when n > 0:
      print("Número positivo: $n");
      break;
    case int n when n < 0:
      print("Número negativo: $n");
      break;
    case int n when n == 0:
      print("Número 0");
      break;
    case String s: //Sin condición adicional
      print("Es un texto: $s");
      break;
    default:
      print("Valor desconocido");
  }

  //Bucles con etiqueta
  externo: // Etiqueta del for superior
  for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
      if (i == 2 && j == 2) {
        print("He realizado un break");
        break externo;
      }
      print('[$i, $j]');
    }
  }

  //For con múltiples variables

  for (int i = 0, j = 10, h = 33; i < 5; i++, j--, h += 2) {
    print("i = $i, j = $j, h = $h");
  }

  // Iteraciones sobre Map
  Map<String, int> edades = {"Ana": 25, "Luis": 30, "María": 28};

  //entries. Pares de clave y valor.
  //values. Valores
  //keys. Claves

  for (var par in edades.entries) {
    print("${par.key} tiene ${par.value} años.");
  }
  for (var clave in edades.keys) {
    print("Nombre: $clave");
  }
  for (var valor in edades.values) {
    print("Edad: $valor");
  }

  //forEach con funciones anónimas

  //Funciones anónimas.
  //Forma extendida
  //(parametro) { multiples sentencias; retur valor}
  //Forma corta o función flecha (arrow)
  //(parametro) => expresión;
  int numero = 7;
  var valor2 = (numero) {
    print("Número $numero * 2: ${numero * 2}  ");
    return numero * 2;
  };

  var valor3 = (numero) => numero * 2;

  List<int> numeros = [12, 1, 11, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  numeros.forEach((numero) {
    print("Número $numero * 2: ${numero * 2}  ");
  });
  numeros.forEach((int) => print("Número $int * 2: ${int * 2}  "));

  // Where. Filtrado que retorna un iterable con elementos que cumplen la condición.

  var pares = numeros.where((n) => n % 2 == 0).toList();
  pares.sort();
  print("$pares de tipo ${pares.runtimeType}");
  numeros.sort();
  print(numeros);

  // Assert (solo funciona en modo debub)
  //Si la condición es falsa lanza un error y detiene la ejecución.

  int velocidad = 120;

  print("Probando assert");
  assert(velocidad <= 120, "Velocidad excede límite");
  print("Velocidad válida: $velocidad km/hora");

  //Switch con multiples condiciones (Desde Dart 3.0.)

  int mes = 10;
  String estacion = switch (mes) {
    12 || 1 || 2 => "Invierno",
    3 || 4 || 5 => "Primavera",
    6 || 7 || 8 => "Verano",
    9 || 10 || 11 => "Otoño",
    _ => "Mes inválido",
  };
  print("Mes $mes: $estacion");

  //Switch con records

  //Records

  //Records posicionales

  var coordenadas = (10, 12, 15, "Manolo", DateTime.now());

  print(coordenadas.$1); // 10
  print(coordenadas.$2); // 1
  print(coordenadas.$3); // 15

  // Records nombrados

  var usuario = (nombre: "Ana", edad: 30);
  print("Nombre: ${usuario.nombre} y edad ${usuario.edad}");

  // Records mixtos

  var datos = ("Felipe", edad: 44, true);

  print(datos.$1); // Felipe
  print(datos.edad); //44
  print(datos.$2); //true
  //datos.edad = 33; //No posible

  var coordenada = (0, "-3");

  String cuadrante = switch (coordenada) {
    (int x, int y) when x > 0 && y > 0 => "Cuadrante I",
    (int x, int y) when x < 0 && y > 0 => "Cuadrante II",
    (int x, int y) when x < 0 && y < 0 => "Cuadrante III",
    (int x, int y) when x > 0 && y < 0 => "Cuadrante IV",
    (String s, String a) => "Somos dos strings",
    (String s, int a) => "Soy un mixto empezando por String",
    (int a, String s) => "Soy un mixto empezando por Int",
    _ => "Sobre un eje",
  };
  print("Coordenada $coordenada: $cuadrante");

  // Iteración con índice valor de una Lista

  List<String> colores = ["Rojo", "Verde", "Azul", "Naranja"];

  for (int x = 0; x < colores.length; x++) {
    print("Indice: $x y valor: ${colores[x]}");
  }
  print("================");
  //Indexed devuelve un iterable de records de una lista (indice, valor).
  //Con destructuring
  for (var (index, color) in colores.indexed) print("$index: $color");
  //Sin destructuring
  print("================");
  for (var record in colores.indexed) {
    print("${record.$1}: ${record.$2}");
  }

  // Control de flujo con try - catch

  // throw: lanza una excepción y nos detiene la ejecución normal.
  // try: bloque que contiene código que puede fallar.
  // catch(e): captura la excepción en la variable e.
  // finally: se ejecuta SIEMPRE, haya un error o no.

  int dividir(int a, int b) {
    if (b == 0) throw Exception("División por cero no permitida");
    return a ~/ b;
  }

  print("Control de flujo conb try-catch");

  try {
    int resultado = dividir(10, 2);
    print("Resultado: $resultado");
    int error = dividir(10, 0);
    print("Este mensaje no se imprime");
  } catch (e) {
    print("Error capturado: $e");
  } finally {
    print("Bloque finally SIEMPRE se ejecuta");
  }
}
