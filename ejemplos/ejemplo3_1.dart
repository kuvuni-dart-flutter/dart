//Estructuras de control 

void main(){
  //If simple

  int edad = 18;
  if( edad >= 18) {
    print("Es mayor de edad");
  }

  // else if
  int age = 18;
  if( age >= 18) {
    print("Es mayor de edad");
  } else {
    print("No ess mayor de edad");
  }

  // if - else - if

  int nota = 8;
  if (nota >= 9) print("Sobresaliente");
  else if(nota >= 7) print("Notable");
  else if(nota >= 5) print("Aprobado");
  else print("Suspenso");

  if(nota >= 9) print("Sobresaliente");
  else{
    if(nota >=7) print("Notable");
    else{
      if (nota>= 5) print("Aprobado");
      else print("Suspenso");
    }
  }
  
  //For básico

  for(int i = 0; i <= 5; i++){
      if(i == 3) continue;
    print("El valor de i es $i");

  }

  for(int i = 0; i <= 10; i++){
    print(i * 7);
  }
  for(int i = 0, j=0; i<= 10; i++, j+=7) print(j);

  print("========================");
  //While
  int contador = 1;
  while(contador <= 10) {

    print('While: $contador');
    ++contador;
  }

  //Do while

  int numero = 1;
  do {
    print('Do while: $numero');
    numero--;
  } while (numero > -5);

  //Imprimir los pares del -20 al 20
  int valor = -21;

  while(true){
    if (valor > 20) break;
    valor++; 
    if(valor %2 != 0) continue;
    print(valor);
   
  }

  String diaSemana = 'sábado';
  switch (diaSemana){
    case "lunes":
    case "martes":
    case "miércoles" || "jueves":
    case "viernes" :
     print("Dia laboral");
     break;
    case "sábado" || "domingo":
     print ("Fin de semana");
     break;
    default: 
     print('Dia no válido');

  } 

  // For in. Iterar listas

  List<String> frutas = ["Manzana", "Naranja", "Plátano"];

  for( String fruta in frutas ) print(fruta);
  print("====?===");
  for (int i = 0; i < frutas.length; i+=1) print(frutas[i]);

  for( int i = 1; i <= 3; i++ ){
    for( int j = 1; j <=3 ; j++){
      print('[$i, $j]');
    }
  }


}