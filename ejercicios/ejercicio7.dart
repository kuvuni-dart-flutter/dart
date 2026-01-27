void main(){
//
Map<String, Function> crearContador(){
  int contador = 0;
  return{
    'incrementar' : () => ++contador ,
    'decrementar' : () => --contador ,
    'obtenerValor' : () => contador ,
    'reiniciar' : (){
      contador = 0;
      print("Contador reiniciado a 0");
    },
    'sumar' : (int n) => contador += n ,
    'restar' : (int n) => contador -= n ,
  };
}

var contador1 = crearContador();
print("Incrementar: ${contador1['incrementar']!()}"); //1
print("Incrementar: ${contador1['incrementar']!()}"); //2
print("Obtener valor: ${contador1['obtenerValor']!()}"); //2
print("Sumar: ${contador1['sumar']!(5)}"); //7
print("Restar: ${contador1['restar']!(15)}"); //-8

var contador2 = crearContador();
print("Incrementar contador2 : ${contador2['incrementar']!()}"); //1
contador2['reiniciar']!();
print("Obtener valor contador 2: ${contador2['obtenerValor']!()}");  //0

print("Sumar contador2: ${contador2['sumar']!(5)}"); //5

//Ejercicio 2

//Funciones auxiliares
bool esPar(int n) => n % 2 == 0;
int duplicar(int n) => n * 2;
int sumarTodos(int a, int b) => a + b;
int alCuadrado(int n) => n * n;
bool esMultiplo (int numero, int divisor) => numero % divisor == 0;
 
List<int> aplicarOperacion(List<int> lista, int Function(int) operacion){
/*
List resultado = [];
for(var elemento in lista) resultado.add(operacion(elemento));
return resultado;
*/
  return lista.map(operacion).toList();
}

var numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9 ,10];
print(numeros);
print('Duplicar: ${aplicarOperacion(numeros, duplicar)}');
print('Al cuadrado: ${aplicarOperacion(numeros, alCuadrado)}');

List<int> filtrarPor(List<int> lista, bool Function(int) condicion){
  List<int> resultado = [];
  for(int elemento in lista){
    if(condicion(elemento)) resultado.add(elemento);
  }
  //return resultado;
  return lista.where(condicion).toList();
}
List<int> filtrarPor2(List<int> lista,  condicion){
 /* List<int> resultado = [];
  for(int elemento in lista){
    if(condicion(elemento)) resultado.add(elemento);
  }*/
  //return resultado;
  return lista.where(condicion).toList();  //Puede crashear dependiedo del tipo que pasemos.
}

print('Es par: ${filtrarPor(numeros, esPar)}');
//print('Es par: ${filtrarPor2(numeros, true)}');
print('Es par: ${filtrarPor2(numeros, (int n)=> n % 2 == 0)}');

int combinarElementos(List<int> lista, int Function(int, int) combinador){
  int acumulador = lista[0];
  for(int i = 1; i < lista.length; i++){
    acumulador = combinador(acumulador, lista[i]);
  }
  //return resultado;
  return lista.reduce(combinador);
}

print("Combinador: ${combinarElementos(numeros, sumarTodos)}");

dynamic procesarLista(List<int> lista, List<Function> funciones){
  dynamic resultado = lista;
  for(var funcion in funciones){
    resultado = funcion(resultado);
    print(resultado);
  }

  return resultado;

}

var resultado = procesarLista(numeros, [
  (lista) => filtrarPor(lista, esPar),
  (lista) => aplicarOperacion(lista, duplicar),
  (lista) => combinarElementos(lista, sumarTodos)
]);
print(resultado);

}