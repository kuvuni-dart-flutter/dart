//Clase simple.
//Un molde para crear objetos. Propiedades (datos) y métodos (acciones).

import 'dart:math';

class Persona {
  //Propiedades (atributos)
  String nombre;
  int edad;

  //Constructor
  Persona(this.nombre, this.edad);

  //Métodos

  void saludar() {
    print("Hola, me llamo $nombre y tengo $edad años");
  }

  String presentacion() {
    return "$nombre ($edad años)";
  }
}

//Clase sin constructor

class Alumno {
  String? nombre;
  String? apellidos;
  int edad = 0;

  void saludar() {
    print("Hola, me llamo $nombre $apellidos con $edad años");
  }
}

//Constructores con parámetros opcionales

class Estudiante {
  String nombre; //Obligatorio
  int edad; // Obligatorio
  String? especialidad; //Opcional
  double promedio; //Opcional

  Estudiante(this.nombre, this.edad, [this.especialidad, this.promedio = 0]);

  String info() {
    String esp = especialidad ?? "No definida";
    return "$nombre - Edad: $edad - Especialidad: $esp - Promedio: $promedio";
  }

  //Método toString()
  //@override No es obligatorio, sólo para hints y warnings
  String toString() {
    return "$nombre, $edad, $especialidad, $promedio";
    //return edad;
  }
}

//Inicialización y valores por defecto

class Producto {
  String nombre;
  double precio;
  int stock = 0;
  bool disponible = false;
  List<String> categorias = [];

  Producto(this.nombre, this.precio);

  void agregarStock(int stock) {
    this.stock += stock;
    if (this.stock > 0) disponible = true;
  }

  void reducirStock(int cantidad) {
    if (cantidad > stock) {
      print("Datos no validos");
      return;
    }
    stock -= cantidad;
    if (stock == 0) disponible = false;
  }

  String obtenerEstado() {
    return "Disponible: $disponible, Stock: $stock";
  }
}

//Composición de objetos. Objetos que contienen otros objetos.

class Motor {
  String tipo;
  double cilindrada;
  int potencia;

  Motor(this.tipo, this.cilindrada, this.potencia);

  String info() => '$tipo - $cilindrada cc - $potencia CV';
}

class Conductor {
  String nombre;
  int edad;
  String licencia;

  Conductor(this.nombre, this.edad, this.licencia);

  String info() => "$nombre, $edad, $licencia";
}

class Auto {
  String marca;
  String modelo;
  Motor motor;
  Conductor? conductor;

  Auto(this.marca, this.modelo, this.motor, [this.conductor]);

  void mostrarDetalles() {
    print("Auto: $marca $modelo");
    print("Motor: ${motor.info()}");
    if (conductor != null) {
      print("Conductor: ${conductor!.info()}");
    } else
      print("Sin conductor");
  }

  void asignarConductor(Conductor c) {
    conductor = c;
    print("Conductor asignado: ${c.nombre}");
  }
}

//Propiedades privadas y Getters / Setters

//Getters: Métodos para leer la propiedades privadas
//Setters: Métodos para escribir propiedades privadas pero con validaciones
//Proteger los datos y asegurar que siempre sean válidos

class Cuenta {
  String _titular; //propiedades con _ solo se acceden dentro de la clase
  double _saldo;
  int numeroCuenta;

  Cuenta(this._titular, this.numeroCuenta, this._saldo);

  /*double get saldo{
    print("probando");
    return _saldo;
  }*/
  double get saldo => _saldo;

  int get length {
    return numeroCuenta.toString().length;
  }

  /* set saldo(double nuevoSaldo){
    if(nuevoSaldo >= 0) _saldo = nuevoSaldo;
    else print("Error: El saldo no puede ser negativo");
  }*/
  set saldo(double saldo) {
    this._saldo = saldo;
  }

  String resumen() {
    return "Titular: $_titular, Saldo: $_saldo ";
  }
}

//Constructores nombrados. Formas alternativas para
//crear un objeto.

class Coche {
  String marca;
  String modelo;
  int anio;
  String combustible;

  Coche(this.marca, this.modelo, this.anio, this.combustible);
  Coche.electrico(this.marca, this.modelo, this.anio)
    : combustible = "Eléctrico";
  Coche.fromString(String datos)
    : marca = datos.split(',')[0].trim(),
      modelo = datos.split(',')[1].trim(),
      anio = int.parse(datos.split(',')[2].trim()),
      combustible = datos.split(',')[3].trim();

  void mostrarInfo() {
    print("$marca, $modelo, $combustible, $anio");
  }
}

//Parametros nombrados

class Usuario{
  String nombre;
  int edad;
  String email;
  bool activo;
  String? telefono;

  Usuario({
    //Obligatorios. required
    required this.nombre,
    required this.edad,
    required this.email,
    //Sin required serían los opcionales
    this.activo=true,
    this.telefono,
  });

  String resumen(){
    String estado = activo ? "Activo" : "Inactivo";
    String tel = telefono ?? "Sin teléfono";
    return "$nombre ($edad años) - $email - $estado - Tel: $tel";
  }
}

//Herencia. Una clase hereda propiedades y métodos de una clase padre.

//Clase abstracta. No se pueden instanciar objetos, solo se hereda

abstract class Animal {
  String nombre;
  int edad;
  
  Animal(this.nombre, this.edad);

  void envejecer(){
    edad++;
    print("$nombre ahora tiene $edad años");
  }

  void hacerSonido(); //Obligando a implementar este método.
  void dormir(){
    print("$nombre esta durmiendo ...");
  }
}
 //Clase hija

   class Gato extends Animal {
    String raza;

    Gato(String nombre, int edad, this.raza) : super(nombre, edad);
    
      @override
      void hacerSonido() {
      print("Miauuuuu");
      }
     }

     class Pajaro extends Animal{
      double alturaVuelo;

      Pajaro(String nombre, int edad, this.alturaVuelo) : super(nombre, edad);
      
        @override
        void hacerSonido() {
          print("Pio Pio");
        }
      
        void volar(){
          print("$nombre esta volando a $alturaVuelo m de altura");
        }
     }

// Mixin: Una forma de reutilizar código sin herencia.
//Permite que una clase tenta carcterísiticas de múltiples mixins.
//Diferencia con una herencia: No es una relación de "es un",
//sino "tiene capacidad de"

mixin CapacidadDeVolar {
  void volar(){
    print("Estoy volando");
  }
}

mixin CapacidadDeNadar {
  void nadar(){
    print("Estoy nadando");
  }
}

mixin CapacidadedeSaltar {
  void saltar(String nombre){
    print("Esto saltando $nombre");
  }
  void nada(){
    print("Salto nada");
  }
  
}

class Rana extends Animal with CapacidadDeNadar, CapacidadedeSaltar{
  @override
  void hacerSonido() {
    print("Croaaaac");
  }
  Rana(String nombre, int edad) : super(nombre, edad);
   
  void nadar(){
    print("Estoy nadando desde la clase");
  }

}

// Genéricos. Permitena a una clase que funcione 
//con cualquier tipo de datis,

//Type. <T> Tipo generico

class Caja<T> {
   List<T> items = [];

   void guardar ( T item){
    items.add(item);
    print("Guardado $item");
   }
   String toString(){
    print(items);
    return items.runtimeType.toString();
   }
}

// Propiedades y métodos estáticos
// Estático, pertenece a la clase, no al objeto.

class Persona2 {
  static int conteo = 0; //Propiedad estática

  String nombre;
  int edad;

  Persona2(this.nombre, this.edad) {
    conteo++;
  }

  void saludar(){
    print("Hola, soy $nombre");
  }
  
  static void mostrarTotalPersonas(){
    print("Total de personas creadas: $conteo");
  }

}



void main() {
  //Instanciar un objeto de la clase persona.

  var persona1 = Persona("Manolo", 20);
  Persona persona2 = Persona("Ana", 33);
  //Método toString()
  persona1.saludar();
  persona2.saludar();
  print("Datos de la persona1: ${persona1.presentacion()}");

  Alumno alumno1 = Alumno();
  alumno1.saludar();
  alumno1.nombre = "Pepito";
  alumno1.apellidos = "López López";
  alumno1.edad = 44;
  alumno1.saludar();

  var estudiante1 = Estudiante("Luis", 50);
  print(estudiante1.info());
  Estudiante estudiante2 = Estudiante("Pepe", 15, "Matématicas", 9);
  print(estudiante2.info());
  print("Nombre: ${estudiante2.nombre} Promedio: ${estudiante2.promedio}");
  print(estudiante2);

  Producto producto1 = Producto("Teléfono", 50.0);
  print(producto1.obtenerEstado());
  producto1.agregarStock(5);
  print(producto1.obtenerEstado());
  producto1.reducirStock(3);
  print(producto1.obtenerEstado());

  //Composicion

  var motor1 = Motor('V8', 2000, 100);
  Conductor conductor1 = Conductor("José", 25, "B1");

  Auto auto1 = Auto("Seat", "Ibiza", motor1);
  Auto auto2 = Auto("Ford", "Fiesta", Motor("V6", 1200, 80));

  auto1.mostrarDetalles();
  auto2.asignarConductor(conductor1);
  auto2.mostrarDetalles();
  auto1.asignarConductor(Conductor("Antonio", 44, "C1"));
  auto1.mostrarDetalles();
  auto1.conductor!.edad = 45;
  auto1.mostrarDetalles();

  //Propiedades privadas

  Cuenta cuenta1 = Cuenta("José", 1, 1000);
  print("${cuenta1._titular} Número de cuenta ${cuenta1.numeroCuenta}");
}
