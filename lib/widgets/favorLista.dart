import 'package:flutter/material.dart';

class FLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bienvenidos a los pedidos',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pedidos'),
        ),
        body: Center(
          child: Text('Lista Favores'),
        ),
      ),
    );
  }
}
