import 'package:flutter/material.dart';
import 'package:karma/classes/favor.dart';
import 'package:karma/pages/constants.dart';
import 'constants.dart';
import 'package:karma/backend/firebase_auth.dart';

class Ffavor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int id = 1;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Escriba la información del favor',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          title: Text('Favor'),
        ),
        body: Stack(
          children: <Widget>[
            Container(decoration: BoxDecoration()),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[],
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(currentSignedInUser.name),
                decoration: BoxDecoration(color: mainColor),
              ),
              ListTile(
                title: Text('Pedir Favor'),
                onTap: () {
                  Navigator.of(context).pushNamed("/Fpedidos");
                },
              ),
              ListTile(
                title: Text('Lista Favores'),
                onTap: () {
                  Navigator.of(context).pushNamed("/Flista");
                },
              ),
              ListTile(
                title: Text('Favores Seleccionados'),
                onTap: () {
                  Navigator.of(context).pushNamed("/Fseleccionados");
                },
              ),
              ListTile(
                title: Text('Perfil'),
                onTap: () {
                  Navigator.of(context).pushNamed("/perfil");
                },
              ),
              ListTile(
                title: Text('Log out'),
                onTap: () {
                  Navigator.of(context).pushNamed("/login");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
