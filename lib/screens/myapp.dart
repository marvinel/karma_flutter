import 'package:karma/widgets/favorLista.dart';
import 'package:karma/widgets/favorPedido.dart';
import 'package:karma/widgets/favoresSeleccionados.dart';
import 'package:karma/widgets/login.dart';
import 'package:karma/widgets/perfil.dart';
import 'package:karma/widgets/registro.dart';
import 'package:flutter/material.dart';

import '../widgets/registro.dart';

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
