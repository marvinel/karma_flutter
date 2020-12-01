import 'package:flutter/material.dart';
import 'package:karma/pages/constants.dart';
import 'constants.dart';
import 'package:karma/backend/firebase_auth.dart';
import 'package:karma/classes/favor.dart';

class Fseleccionados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bienvenidos a los pedidos',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          title: Text('Pedidos'),
        ),
        body: Stack(
          children: <Widget>[
            Container(decoration: BoxDecoration()),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _buildOptions(),
                _buildList(),
              ],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildOptions() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Container(
        child: Text(
          "Favores Seleccionados:",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}

// ignore: non_constant_identifier_names
Widget _buildFavorInfo(Favor f) {
  return Container(
    width: 370,
    height: 230,
    child: Card(
      color: Colors.deepPurple[900],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 15),
          Text(
            f.type,
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          SizedBox(height: 10),
          Text(
            f.status,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            f.user_asking,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            f.details,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            f.delivery,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 10),
          Container(
            width: 330,
            child: RaisedButton(
              child: Text(
                "Chat",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.green,
              onPressed: () {},
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildList() {
  // List<Favor> favores = [
  //   Favor(
  //       name: 'Bill Will',
  //       personAsking: 'Marvin Henriquez',
  //       details: "Software Developer",
  //       deliveryPoint: "la casa",
  //       status: "inicial"),
  //   Favor(
  //       name: 'Jhoner Pineda',
  //       personAsking: 'Marvin',
  //       details: "Software Developer",
  //       deliveryPoint: "p7",
  //       status: "1")
  // ];
  // return Column(
  //   children: favores.map((f) {
  //     return _buildFavorInfo(f);
  //   }).toList(),
  // );
}
