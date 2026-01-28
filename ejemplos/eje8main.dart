import 'ejemplo8POO.dart';

void main(){
  //Propiedades privadas

Cuenta cuenta1 = Cuenta("José", 10000, 1000);
print("Saldo: ${cuenta1.saldo} Número de cuenta ${cuenta1.numeroCuenta}");

print(cuenta1.resumen());
cuenta1.saldo = 2000;
print(cuenta1.resumen());
print(cuenta1.length);

var coche1 = Coche("Seat", "Ibiza", 2024, "gasoil");
coche1.mostrarInfo();
Coche coche2 = Coche.electrico("Ford", "Fiesta", 2025);
coche2.mostrarInfo();
Coche coche3 = Coche.fromString("Renault, Twingo, 1990,gasolina");
coche3.mostrarInfo();

var usuario1 = Usuario(
  edad: 18,
  email: "Jose@gmail.com",
  nombre: "Luisa",
  telefono: "655553443",
  activo: false, 
  );
print(usuario1.resumen());
var animal1 = Gato("Toby", 5, "Persa");
animal1.envejecer();
animal1.dormir();
animal1.hacerSonido();
animal1.nombre="Gatin";
animal1.envejecer();
Pajaro animal2 = Pajaro("Jiji", 3, 45);
animal2.volar();
animal2.hacerSonido();

Rana animal3 = Rana("Pepi", 1);
animal3.saltar(animal3.nombre);
animal3.nada();
animal3.nadar();


var caja1 = Caja<int>();
caja1.guardar(4);
print(caja1);
//caja1.guardar("Hola");
var caja2 = Caja<dynamic>();
caja2.guardar(true);
caja2.guardar(coche3);
print(caja2);

var per1 = Persona2("Pepe", 20);
var per2 = Persona2("Luis", 30);
var per3 = Persona2("Sara", 40);
per3.saludar();
Persona2.mostrarTotalPersonas();
Persona2.conteo = 25;
var per4 = Persona2("Sara", 40);
Persona2.mostrarTotalPersonas();





}