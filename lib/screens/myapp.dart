import 'package:karma/pages/favorLista.dart';
import 'package:karma/pages/favorPedido.dart';
import 'package:karma/pages/favoresSeleccionados.dart';
import 'package:karma/pages/login.dart';
import 'package:karma/pages/perfil.dart';
import 'package:karma/pages/registro.dart';
import 'package:flutter/material.dart';

import '../pages/registro.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      routes: {
        '/login': (context) => MyHomePage(title: "Login"),
        '/registro': (context) => Registro(title: "Registro"),
        '/Fpedidos': (context) => Fpedido(),
        '/Flista': (context) => FLista(),
        '/perfil': (context) => Perfil(),
        '/Fseleccionados': (context) => Fseleccionados(),
      },
      initialRoute: '/login',
    );
  }
}
