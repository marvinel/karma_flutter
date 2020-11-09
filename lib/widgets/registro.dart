import 'package:flutter/material.dart';

class Registro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Iniciar sesion"),
          onPressed: (){
            Navigator.of(context).pop();
          },
          ),)
    );
  }
}