void main(){

  //Set es una colección no ordenada de elementos únicos.
  //No se puede acceder por índice.
  //También llamados conjuntos.

  Set<int> numeros = {1, 2, 3, 4, 4};
  print(numeros);
  //print(numeros[2]); error

  var letras = Set<String>.from(['a', 'b', 'c']);
  print(letras);
  var letras2 = "abcd".split("").toSet();
  print("letras2: $letras2. Tipo: ${letras2.runtimeType}");

  var vacio = <String>{};
  var vacio2 = Set<String>();
  var vacio3 = {}; //Crea un Map.

  print(vacio.runtimeType);
  print(vacio2.runtimeType);
  print(vacio3.runtimeType);

  //Operaciones básicas.

  var frutas = {'Manzana', "Pera", "Naranja"};
  frutas.add("Melón");
  frutas.addAll(["kiwi", "Fresa", "Pera"]);
  print(frutas);

  frutas.remove("Pera");
  print(frutas);

  print("¿Contiene naranja: ${frutas.contains("Naranja")}?");
   print("¿Contiene uva: ${frutas.contains("Uva")}?");

  print("Elementos del conjunto frutas: ${frutas.length}");

  //Unión, Intersección y diferencia de dos conjuntos.

  var setA = {1, 2, 3.0, 4, 5};
  var setB = {4.0, 5, 6, 7, 8};

  var union= setA.union(setB);
  print(union);
    print(union.runtimeType);
  union.forEach((ele){
    print(ele);
    print(ele.runtimeType);

  });

  //Intersección. Elementos que están en los dos conjuntos

  var interseccion = setB.intersection(setA);
  print(interseccion);

  //Diferencia: Elementos que están en A, pero no en B;
  var diferencia = setA.difference(setB); //1, 2, 3
  print(diferencia);
  diferencia = setB.difference(setA); //6, 7, 98
  print(diferencia);

  //Verificar un subconjunto.
  var subSet = {2, 3};
  print("¿{2,3} es subconjunto de A? ${subSet.difference(setA).isEmpty}"); //true
  print("¿{2,3} es subconjunto de A? ${subSet.intersection(setA).length == subSet.length}"); //true

  //Iterar sobre sets.
  
  var colores = {'rojo', 'verde', 'azul', 'amarillo'};

  for(var color in colores) print("  -$color");

  colores.forEach((color) => print("  -$color"));
  
  // Métodos de transformación.  where, map, any, every

  var nums = {1, 2, 3, 4, 5, 6};
  var pares = nums.where((n)=> n%2==0).toSet();
  print(pares);
  var cuadrados = nums.map((n)=> n*n).toSet();
  print(cuadrados);
  print("¿Hay algún elemento mayor que 5?:${nums.any((n) => n > 5)}");
  nums.remove(6);
  print("¿Hay algún elemento mayor que 5?:${nums.any((n) => n > 5)}");

  print("¿Todos los elementos son mayores que 0?: ${nums.every((n)=> n >0)}");


  //MAPAS (colección de clave - valor)

  Map<String, int> edades = {"ana" : 25, "pepe" : 32, "antonio": 45};
  var capitales = Map<String, String>();
  capitales['España'] = 'Madrid';
  capitales['Francia'] = 'Paris';

  //Map.fromEntries
  var entries = [
    MapEntry("lunes", 1),
    MapEntry("martes", 2),
    MapEntry("miércoles", 3),
    MapEntry("martes", 5), //Cambia el valor.
  ];
  var diaSemana = Map.fromEntries(entries);
  print(diaSemana);

  //Acceder por clave
  print (diaSemana['lunes']); //1
  //Modificar valor
  diaSemana["martes"]=2;
  print(diaSemana);
  //Añadir nueva clave-valor
  diaSemana["jueves"]=4;
  diaSemana.addEntries([MapEntry("sábado", 6)]);
  diaSemana.addAll({"Domingo" : 7, 'Viernes' : 5 });
  print(diaSemana);
  //
  print(diaSemana['patito']??"Desconocido");

  //Métodos básicos.

  print("Tiene viernes: ${diaSemana.containsKey("Viernes")}");
  print("Tiene el valor 5: ${diaSemana.containsValue(5)}");

  print("Todas las claves: ${diaSemana.keys}");
  print("Todas los valores: ${diaSemana.values}");
  print("Cantidad de entries: ${diaSemana.length}");

  //isEmpty e isNotEmpty

  //Eliminar alguna entrie por clave

  diaSemana.remove("Viernes");
  print(diaSemana);
  diaSemana.clear(); //Vacia el mapa
  print(diaSemana);

  //Iteraciones

  //Usamos entries

  for( var entry in edades.entries){
    print("Clave: ${entry.key}. Valor: ${entry.value}");
  }
  print("=============");
  for( var key in edades.keys){
    print("Clave: $key. Valor: ${edades[key]}");
  }
  print("=============");
  edades.forEach((clave, valor){
   print("Clave: $clave. Valor: $valor");
  });

  //Métodos

  //putInAbsent :  agregar si la clave no existe.
  capitales.putIfAbsent("Italia", () => "Roma");
  print(capitales);
  capitales.putIfAbsent("Italia", () => "Milán"); //No lo modifica
  print(capitales);

  capitales['Italia']= "Milán";
  print(capitales);
  capitales.update('Italia', (_)=> "Roma");
  print(capitales);
  capitales.update('Italia', (valor)=> valor.toLowerCase());
  print(capitales);
  capitales.update('Alemania', (valor)=> valor.toLowerCase(), ifAbsent: ()=>"berlin"); //En el supuesto de que no exista la clave
  print(capitales);

  //map()

  var precios = {'cafe' : 1.4, 'agua' : 0.5, 'vino' : 3.15};

  var precios10 = precios.map((key, value){

   return MapEntry(key, (value*1.10).toStringAsFixed(2));
  });
  print(precios);
  print(precios10);

  //Crea un copia de un mapa en otro.
  var copiaSuperficial = Map.from(precios); //Superficial
  var copiaSimilar = Map.of(precios);
  var copia2 = precios; //Apuntan a la misma dirección de memoria. Son el mismo objeto.

  precios['pan']= 0.5;
  print(copia2);

  //removeWhere eliminar elementos cuando cumplen una condición
  precios.removeWhere((key, value)=> value < 1 );
  print(precios);

 //Mapas anidados
 var empresa = {
  'departamentos' : {
    'IT' : { 'empleados' : 15, 'presupuesto' : 500000},
    'Ventas' : { 'empleados' : 45, 'presupuesto' : 300000000},
  },
  'ubicacion': "Madrid",
 };

  var departamentos = empresa['departamentos'] as Map;  //Hacer un casting a Map

  var dptos = Map.from(empresa['departamentos'] as Map); //Dos formas.

  print("Departamento IT ${departamentos['IT']}");

  print(empresa);
 
} 