import 'package:flutter/material.dart';
import 'package:karma/classes/favor.dart';
import 'package:karma/widgets/constants.dart';
import 'constants.dart';

class Fseleccionados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int id = 1;

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
                child: Text("Kebin Ramirez"),
                decoration: BoxDecoration(color: mainColor),
              ),
              ListTile(
                title: Text('Pedir Favor'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Lista Favores'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Favores Seleccionados'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Perfil'),
                onTap: () {
                  Navigator.pop(context);
                },
              )
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

Widget _buildFavorInfo(Favor) {
  return Container(
    width: 370,
    height: 280,
    child: Card(
      color: Colors.deepPurple[900],
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              Favor.name,
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            SizedBox(height: 10),
            Text(
              Favor.status,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              Favor.personAsking,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              Favor.details,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              Favor.deliveryPoint,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              child: Expanded(
                child: RaisedButton(
                  child: Text(
                    "Chat",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                  onPressed: () {},
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Expanded(
                child: RaisedButton(
                  child: Text(
                    "Terminar",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildList() {
  List<Favor> favores = [
    Favor(
        name: 'Bill Will',
        personAsking: 'djnhdkidk',
        details: "Software Developer",
        deliveryPoint: "jdkddkl",
        status: "dhsksn"),
    Favor(
        name: 'Jhoner Pineda',
        personAsking: 'Marvin',
        details: "Software Developer",
        deliveryPoint: "p7",
        status: "1")
  ];
  return Column(
    children: favores.map((f) {
      return _buildFavorInfo(f);
    }).toList(),
  );
}
