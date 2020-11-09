import 'package:karma/widgets/login.dart';
import 'package:karma/widgets/registro.dart';
import 'package:flutter/material.dart';

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
        '/home': (context) => Registro(),
        '/pedidos': (context) => Registro(),
        '/perfil': (context) => Registro(),
      },
      initialRoute: '/login',
    );
  }
}
