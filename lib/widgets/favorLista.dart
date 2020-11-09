import 'package:flutter/material.dart';
import 'package:karma/classes/favor.dart';
import 'package:karma/widgets/constants.dart';

import 'constants.dart';

class FLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int id = 1;

    return MaterialApp(
      title: 'Bienvenidos a los pedidos',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pedidos'),
        ),
        body: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _buildOptions(),
                _buildRadioButtons(),
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
                child: Text("Nombre de Usuario"),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildContainer() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Text("Registro", style: TextStyle())],
                ),
                _buildRadioButtons()
              ],
            )),
      )
    ],
  );
}

Widget _buildOptions() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Container(
        child: Text(
          "Favores:",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        child: RaisedButton(
          color: Colors.green,
          onPressed: () {},
          child: Text("FILTRAR"),
        ),
      ),
      Container(
        child: RaisedButton(
          color: Colors.green,
          onPressed: () {},
          child: Text("LIMPIAR"),
        ),
      ),
    ],
  );
}

Widget _buildRadioButtons() {
  int id = 1;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Radio(value: 1, groupValue: id, onChanged: null),
      Text("Sacar Copias"),
      Radio(value: 1, groupValue: id, onChanged: null),
      Text("Comprar Km5"),
      Radio(value: 1, groupValue: id, onChanged: null),
      Text("Domicilio P7")
    ],
  );
}

Widget _buildFavorInfo(Favor) {
  return Container(
    width: 240,
    height: 240,
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
              child: RaisedButton(
                child: Text(
                  "Hacer Favor",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
                onPressed: () {},
              ),
            )
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
