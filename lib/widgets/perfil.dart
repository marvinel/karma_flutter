import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bienvenidos al perfil',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perfil'),
        ),
        body: Center(
          child: Text('Informacion personal'),
        ),
      ),
    );
  }
}
