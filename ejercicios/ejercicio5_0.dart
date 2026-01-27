import 'dart:io'; 
import 'dart:math'; 

void main() {
  // Bucle principal: muestra menú y procesa opciones hasta que el usuario salga
  while (true) {
    print('\n=== Soluciones Ejemplo 5: Ejercicios 1 y 2 ==='); // Cabecera del menú
    print('1. Juego de Bingo'); // Opción para ejecutar el ejercicio 1
    print('2. Agenda de contactos'); // Opción para ejecutar el ejercicio 2
    print('0. Salir'); // Opción para terminar el programa
    stdout.write('Elige opción: ');
    String opcion = stdin.readLineSync()?.trim() ?? ''; 

    switch (opcion) {
      case '0': 
        print('Hasta luego.'); 
        return; 
      case '1': 
        runBingo();
        break;
      case '2':
        runAgenda(); 
        break;
      default:
        print('Opción no válida.'); // Informa de la opción inválida
    }
  }
}

// Ejercicio 1: Juego de Bingo
void runBingo() {
  var random = Random(); // Generador de números aleatorios

  Set<int> carton = {}; // Set para almacenar números únicos del cartón
  while (carton.length < 15) { // Genera 15 números únicos entre 1 y 60
    carton.add(random.nextInt(60) + 1); // Añade un número aleatorio (1..60)
  }
  List<int> cartonOrdenado = carton.toList()..sort(); // Convierte a lista y ordena
  print('\nTu cartón: $cartonOrdenado'); // Muestra el cartón al usuario

  Set<int> sorteados = {}; // Números ya sorteados (para evitar repeticiones)
  Set<int> aciertos = {}; // Números acertados del cartón
  while (aciertos.length < carton.length) { // Continúa hasta acertar todo el cartón
    int bola; // Variable para la bola actual
    do { // Genera una bola que no haya salido antes
      bola = random.nextInt(60) + 1; // Número aleatorio entre 1 y 60
    } while (sorteados.contains(bola)); // Repite si ya fue sorteado
    
    sorteados.add(bola); // Marca la bola como sorteada
    print('Sale la bola: $bola'); // Muestra la bola
    sleep(const Duration(milliseconds: 400)); // Pausa breve para simular el sorteo

    if (carton.contains(bola)) { // Comprueba si la bola está en el cartón
      aciertos.add(bola); // Añade la bola a los aciertos
      final aciertosOrdenados = aciertos.toList()..sort(); // Ordena aciertos para mostrar
      print('¡Acertaste! Números acertados: $aciertosOrdenados'); // Feedback de acierto

      // Muestra el cartón destacando los números ya acertados
      final estadoCarton = cartonOrdenado
          // Marca con [ ] los números acertados para que se distingan visualmente
          .map((n) => aciertos.contains(n) ? '[$n]' : '$n')
          .join(', ');
      print('Estado del cartón: [$estadoCarton]');

      print('Te faltan ${carton.length - aciertos.length} para completar el cartón.'); // Progreso restante
    }
  }

  print('¡Bingo! Has completado el cartón.'); // Mensaje final al completar todos los números
}

// Ejercicio 2: Agenda de contactos
void runAgenda() {
  final Map<String, String> agenda = {}; // Mapa nombre → teléfono

  while (true) { // Bucle del menú de la agenda
    print('\n--- Agenda ---'); // Cabecera de la sección
    print('1. Añadir  2. Buscar  3. Modificar  4. Eliminar  5. Ver todos  0. Volver'); // Opciones disponibles
    stdout.write('Opción: '); // Solicita una opción
    //En Dart, el operador ?. se llama operador de acceso condicional (null‑aware operator).
    //Sirve para acceder a una propiedad o método solo si el objeto no es null. 
    //Si el objeto es null, la expresión completa devuelve null en lugar de lanzar un error.
    String opcion = stdin.readLineSync()?.trim() ?? ""; // Lee la opción del usuario

    // Map de acciones: cada opción mapea a una función que ejecuta la acción
    Map<String, bool Function()> acciones = {
      
      '1': () { // Añadir contacto
        stdout.write('Nombre: '); // Pide nombre
        String nombre = stdin.readLineSync()?.trim() ?? ""; // Lee y limpia espacios
        stdout.write('Teléfono: '); // Pide teléfono
        String tel = stdin.readLineSync()?.trim() ?? ""; // Lee y limpia espacios
        if ((nombre.isNotEmpty) && (tel.isNotEmpty)) { // Valida entradas
          agenda[nombre] = tel; // Guarda/actualiza el contacto en el mapa
          print('Contacto añadido.'); // Confirmación
        } else { // Entradas inválidas
          print('Datos no válidos.');
        }
        return false; // Continúa en el bucle
      },
      '2': () { // Buscar contacto
        stdout.write('Nombre a buscar: '); // Pide nombre
        var nombre = stdin.readLineSync()?.trim(); // Lee y limpia espacios
        if (nombre != null && nombre.isNotEmpty) { // Valida nombre
          print(agenda.containsKey(nombre) ? 'Teléfono: ${agenda[nombre]}' : 'No encontrado.'); // Muestra resultado
        } else { // Nombre inválido
          print('Nombre no válido.');
        }
        return false; // Continúa en el bucle
      },
      '3': () { // Modificar teléfono
        stdout.write('Nombre a modificar: '); // Pide nombre
        var nombre = stdin.readLineSync()?.trim(); // Lee y limpia
        if (nombre != null && agenda.containsKey(nombre)) { // Comprueba existencia
          stdout.write('Nuevo teléfono: '); // Pide nuevo teléfono
          var nuevo = stdin.readLineSync()?.trim(); // Lee y limpia
          if (nuevo != null && nuevo.isNotEmpty) { // Valida
            agenda[nombre] = nuevo; // Actualiza teléfono
            print('Teléfono actualizado.'); // Confirmación
          } else { // Teléfono inválido
            print('Teléfono no válido.');
          }
        } else { // Contacto no encontrado
          print('No encontrado.');
        }
        return false; // Continúa en el bucle
      },
      '4': () { // Eliminar contacto
        stdout.write('Nombre a eliminar: '); // Pide nombre
        var nombre = stdin.readLineSync()?.trim(); // Lee y limpia espacios
        if (nombre != null && nombre.isNotEmpty) { // Valida nombre
          agenda.remove(nombre); // Elimina del mapa (si existe)
          print('Eliminado.'); // Confirmación
        } else { // Nombre inválido
          print('Nombre no válido.');
        }
        return false; // Continúa en el bucle
      },
      '5': () { // Ver todos los contactos
        var nombres = agenda.keys.toList()..sort(); // Obtiene y ordena alfabéticamente
        if (nombres.isEmpty) { // Si no hay contactos
          print('No hay contactos.');
        } else { // Imprime la lista ordenada
          print('Contactos:');
          for (final n in nombres) { // Recorre nombres
            print('$n: ${agenda[n]}'); // Muestra nombre y teléfono
          }
        }
        return false; // Continúa en el bucle
      },
    };

    // Ejecuta la acción correspondiente o muestra error
    if (opcion.isEmpty) { // Si no hay entrada, notifica
      print('Entrada no válida.');
    } else {
      // call() invoca la función anónima almacenada en el Map; ?. evita error si la clave no existe
      // Devuelve true (salir) o false (continuar); ?? false si la opción no existe (default)
      bool debeRetornar = acciones[opcion]?.call() ?? false; // true = salir; false = continuar
      if (debeRetornar) {
        return; // Sale de la función si la acción lo indica
      }
    }
  }
}
