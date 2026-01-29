// ════════════════════════════════════════════════════════════════════════════════
// EJERCICIO 1: SISTEMA DE GESTIÓN DE BIBLIOTECA - SOLUCIÓN
// ════════════════════════════════════════════════════════════════════════════════

// Clase abstracta base para todas las publicaciones
abstract class Publicacion {
  String titulo;
  String autor;
  int anioPublicacion;
  bool _disponible;

  Publicacion(this.titulo, this.autor, this.anioPublicacion)
      : _disponible = true;

  // Getter: Permite leer si está disponible
  bool get disponible => _disponible;

  // Setter: Permite cambiar disponibilidad con validación
  set disponible(bool valor) {
    _disponible = valor;
  }

  // Métodos abstractos que deben implementar las subclases
  String obtenerTipoMaterial();
  int calcularDiasPrestamo();

  // Métodos concretos (iguales para todas las publicaciones)
  bool prestar() {
    if (_disponible) {
      _disponible = false;
      print('✓ "$titulo" ha sido prestado');
      return true;
    } else {
      print('❌ "$titulo" no está disponible');
      return false;
    }
  }

  void devolver() {
    _disponible = true;
    print('✓ "$titulo" ha sido devuelto');
  }

  String obtenerInfo() {
    String estado = _disponible ? 'Disponible' : 'Prestado';
    return '$titulo por $autor ($anioPublicacion) - $estado';
  }
}

// Clase Libro que extiende Publicacion
class Libro extends Publicacion {
  int numeroPaginas;
  String genero; // "Ficción", "No Ficción", "Infantil"

  Libro(String titulo, String autor, int anioPublicacion, this.numeroPaginas,
      this.genero)
      : super(titulo, autor, anioPublicacion);

  @override
  String obtenerTipoMaterial() => 'Libro';

  @override
  int calcularDiasPrestamo() => 14; // Los libros se prestan 14 días

  @override
  String obtenerInfo() {
    String estado = disponible ? 'Disponible' : 'Prestado';
    return '''
    ╔════════════════════════════════════╗
    ║ 📚 LIBRO
    ║ Título: $titulo
    ║ Autor: $autor
    ║ Año: $anioPublicacion
    ║ Páginas: $numeroPaginas
    ║ Género: $genero
    ║ Préstamo: ${calcularDiasPrestamo()} días
    ║ Estado: $estado
    ╚════════════════════════════════════╝
    ''';
  }
}

// Clase Revista que extiende Publicacion
class Revista extends Publicacion {
  int numero; // Número de revista
  String temaMensual;

  Revista(String titulo, String autor, int anioPublicacion, this.numero,
      this.temaMensual)
      : super(titulo, autor, anioPublicacion);

  @override
  String obtenerTipoMaterial() => 'Revista';

  @override
  int calcularDiasPrestamo() => 7; // Las revistas se prestan 7 días

  @override
  String obtenerInfo() {
    String estado = disponible ? 'Disponible' : 'Prestado';
    return '''
    ╔════════════════════════════════════╗
    ║ 📰 REVISTA
    ║ Título: $titulo
    ║ Número: $numero
    ║ Tema: $temaMensual
    ║ Año: $anioPublicacion
    ║ Préstamo: ${calcularDiasPrestamo()} días
    ║ Estado: $estado
    ╚════════════════════════════════════╝
    ''';
  }
}

// Clase Biblioteca que gestiona colecciones de publicaciones
class Biblioteca {
  String nombre;
  List<Publicacion> publicaciones = [];

  Biblioteca(this.nombre);

  // Agregar una publicación a la biblioteca
  void agregarPublicacion(Publicacion p) {
    publicaciones.add(p);
    print('✓ "${p.titulo}" agregado a $nombre');
  }

  // Prestar una publicación por título (case-insensitive)
  bool prestarPublicacion(String titulo) {
    try {
      var publicacion = publicaciones.firstWhere(
        (p) => p.titulo.toLowerCase() == titulo.toLowerCase(),
      );
      return publicacion.prestar();
    } catch (e) {
      print('❌ No se encontró "$titulo"');
      return false;
    }
  }

  // Devolver una publicación por título
  void devolverPublicacion(String titulo) {
    try {
      var publicacion = publicaciones.firstWhere(
        (p) => p.titulo.toLowerCase() == titulo.toLowerCase(),
      );
      publicacion.devolver();
    } catch (e) {
      print('❌ No se encontró "$titulo"');
    }
  }

  // Obtener solo las publicaciones disponibles
  List<Publicacion> obtenerDisponibles() {
    return publicaciones.where((p) => p.disponible).toList();
  }

  // Obtener solo las publicaciones prestadas
  List<Publicacion> obtenerNoDisponibles() {
    return publicaciones.where((p) => !p.disponible).toList();
  }

  // Mostrar el catálogo completo
  void mostrarCatalogo() {
    print('''
    ╔═══════════════════════════════════════════════════╗
    ║ CATÁLOGO DE $nombre
    ╚═══════════════════════════════════════════════════╝
    ''');

    if (publicaciones.isEmpty) {
      print('La biblioteca está vacía');
      return;
    }

    for (int i = 0; i < publicaciones.length; i++) {
      print('${i + 1}. ${publicaciones[i].obtenerInfo()}');
    }
  }

  // Obtener estadísticas de la biblioteca
  String obtenerEstadisticas() {
    int totalPublicaciones = publicaciones.length;
    int disponibles = obtenerDisponibles().length;
    int prestados = obtenerNoDisponibles().length;

    return '''
    ╔═══════════════════════════════════════════════════╗
    ║ ESTADÍSTICAS DE $nombre
    ╠═══════════════════════════════════════════════════╣
    ║ Total de publicaciones: $totalPublicaciones
    ║ Disponibles: $disponibles
    ║ Prestados: $prestados
    ║ Porcentaje disponible: ${((disponibles / totalPublicaciones) * 100).toStringAsFixed(1)}%
    ╚═══════════════════════════════════════════════════╝
    ''';
  }
}

// ════════════════════════════════════════════════════════════════════════════════
// MAIN - DEMOSTRACIÓN
// ════════════════════════════════════════════════════════════════════════════════

void main() {
  print('╔═════════════════════════════════════════════════════════╗');
  print('║ SISTEMA DE GESTIÓN DE BIBLIOTECA - SOLUCIÓN            ║');
  print('╚═════════════════════════════════════════════════════════╝\n');

  // Crear biblioteca
  var biblioteca = Biblioteca('Biblioteca Municipal de Getafe');

  // Agregar libros
  print('▶ AGREGANDO PUBLICACIONES\n');
  biblioteca.agregarPublicacion(
      Libro('1984', 'George Orwell', 1949, 328, 'Ficción'));
  biblioteca.agregarPublicacion(
      Libro('Cien años de soledad', 'Gabriel García Márquez', 1967, 432, 'Ficción'));
  biblioteca.agregarPublicacion(
      Libro('El sapiens', 'Yuval Noah Harari', 2014, 634, 'No Ficción'));

  // Agregar revistas
  biblioteca.agregarPublicacion(
      Revista('National Geographic', 'Desconocido', 2024, 45, 'Naturaleza'));
  biblioteca.agregarPublicacion(
      Revista('Muy Interesante', 'Desconocido', 2024, 12, 'Ciencia'));

  // Mostrar catálogo completo
  print('\n▶ CATÁLOGO COMPLETO\n');
  biblioteca.mostrarCatalogo();

  // Mostrar disponibles
  print('\n▶ PUBLICACIONES DISPONIBLES\n');
  var disponibles = biblioteca.obtenerDisponibles();
  for (var pub in disponibles) {
    print('  • ${pub.titulo} (${pub.obtenerTipoMaterial()}) - ${pub.calcularDiasPrestamo()} días');
  }

  // Realizar préstamos
  print('\n▶ REALIZANDO PRÉSTAMOS\n');
  biblioteca.prestarPublicacion('1984');
  biblioteca.prestarPublicacion('National Geographic');
  biblioteca.prestarPublicacion('El Quijote'); // No existe

  // Intentar prestar algo que ya está prestado
  print("▶ INTENTANDO PRESTAR PUBLICACIÓN NO DISPONIBLE\n");
  biblioteca.prestarPublicacion('1984');

  // Mostrar estadísticas
  print('\n▶ ESTADÍSTICAS\n');
  print(biblioteca.obtenerEstadisticas());

  // Devolver publicación
  print('▶ DEVOLVIENDO PUBLICACIÓN\n');
  biblioteca.devolverPublicacion('1984');

  // Mostrar catálogo actualizado
  print('\n▶ CATÁLOGO ACTUALIZADO\n');
  biblioteca.mostrarCatalogo();

  // Mostrar estadísticas finales
  print('▶ ESTADÍSTICAS FINALES\n');
  print(biblioteca.obtenerEstadisticas());

  print('═' * 60);
  print('✓ Demostración completada');
  print('═' * 60);
}
