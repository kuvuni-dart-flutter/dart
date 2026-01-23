void main() {
  ejercicio1();
}

void ejercicio1() {
  print('''
╔══════════════════════════════════════╗
║  SISTEMA DE PROCESAMIENTO            ║
║  DE PEDIDOS                          ║
╚══════════════════════════════════════╝

''');
  //Lista de pedidos mixtos

  List<dynamic> pedidos = [
    'Laptop',
    5,
    {'producto': 'Mouse', 'cantidad': 3, 'urgente': true},
    {'producto': 'Teclado', 'cantidad': 2, 'urgente': false},
    -1,
    'Monitor',
  ];

  double totalGeneral = 0;
  int pedidosExitosos = 0;
  int pedidosError = 0;

  int numeroPedido = 0;
  for (var pedido in pedidos){
    numeroPedido++;
    print("Procesando pedido #$numeroPedido:");
    String mensaje = switch(pedido){
     (String producto) => "Tipo: Producto simple (String)\nProducto: $producto\nTarifa: €10.00\n\n",
     (int cantidad) => "Tipo: Cantidad simple (int)\nCantidad: $cantidad unidades.\nTarifa: €${cantidad * 5.00}\n\n",
     (Map mapa) => "Tipo: Pedido completo (Map)\n" + 
     "Producto: ${mapa['producto']}\nCantidad: ${mapa['cantidad']} unidades.\n"+
     "${(mapa['urgente'])? 'Urgente' : ""}\n\n" +
     "Tarifa:",
     _ => ("error")
    };
    print(mensaje);
  }
}
