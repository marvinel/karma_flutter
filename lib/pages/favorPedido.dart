import 'package:flutter/material.dart';
import 'package:karma/classes/favor.dart';
import 'package:karma/pages/constants.dart';
import 'package:karma/backend/firebase_auth.dart';
import 'package:karma/pages/agregarFavor.dart';

import '../backend/firebase_real_time.dart';
import '../classes/favor.dart';
import 'constants.dart';

class Fpedido extends StatelessWidget {
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
        body: FutureBuilder(
          future: obtenerFavorPedido(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (favoresP.type == null) {
                return Stack(
                  children: <Widget>[
                    Container(decoration: BoxDecoration()),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        _buildOptions(),
                        Container(
                          child: Text('no ha pedido ningun favor aun'),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return Stack(
                  children: <Widget>[
                    Container(decoration: BoxDecoration()),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        _buildOptions(),
                        _buildList(),
                      ],
                    ),
                  ],
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
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
        floatingActionButton: _pedirFavor()
            ? FloatingActionButton.extended(
                onPressed: () => _addFavorModalBottomSheet(context),
                label: Text('Pedir Favor'),
                backgroundColor: Colors.green,
              )
            : null,
      ),
    );
  }

  bool _pedirFavor() {
    // ignore: todo
    //TODO Check current user score, if >= 2, return true, else, false
    return true;
  }
}

void _addFavorModalBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext bd) {
        return AgregarFavor();
      });
}

Widget _buildOptions() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Container(
        child: Text(
          "Favor solicitado:",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}

// ignore: unused_element
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
            "Tipo Favor: " + f.type,
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          SizedBox(height: 10),
          Text(
            "Estado: " + f.status,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            "Realizador: " + f.user_toDo,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            "Detalles: " + f.details,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            "Punto Entrega: " + f.delivery,
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

// ignore: missing_return
Widget _buildList() {
  List<Favor> favores = [
    Favor(
        user_asking: favoresP.user_asking,
        user_toDo: favoresP.user_toDo,
        user_askingid: favoresP.user_askingid,
        user_toDoid: favoresP.user_toDoid,
        type: favoresP.type,
        details: favoresP.details,
        status: favoresP.status,
        delivery: favoresP.delivery),
  ];
  print(favores);
  return new Container(
      width: 370,
      height: 550,
      child: new SingleChildScrollView(
        child: new Column(
          children: favores.map((f) {
            return _buildFavorInfo(f);
          }).toList(),
        ),
      ));
}
