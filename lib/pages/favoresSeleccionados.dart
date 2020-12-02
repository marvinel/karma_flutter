import 'package:flutter/material.dart';
import 'package:karma/pages/constants.dart';
import 'constants.dart';
import 'package:karma/backend/firebase_auth.dart';
import 'package:karma/classes/favor.dart';
import 'package:karma/backend/firebase_real_time.dart';

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
        body: FutureBuilder(
          future: listaSeleccionados(),
          builder: (BuildContext contex, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (favoresS.isEmpty) {
                return Stack(
                  children: <Widget>[
                    Container(decoration: BoxDecoration()),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        _buildOptions(),
                        Container(
                          child: Text(
                              'Usted no se encuentra haciendo ningun favor'),
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
                        _buildList(context),
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

Widget _buildFavorInfo(Favor f, BuildContext context) {
  return Container(
    width: 370,
    height: 280,
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
            "Usuario: " + f.user_asking,
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
              onPressed: () {
                Navigator.of(context).pushNamed("/chat");
              },
            ),
          ),
          Container(
            width: 330,
            child: RaisedButton(
              child: Text(
                "Terminar",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.green,
              onPressed: () {
                Future<String> ff = updateFavor2(f);
                ff.then((val) {
                  if (val == "OK") {
                    Future<String> pu =
                        cambiarKarma2(f.user_askingid, f.user_toDoid);
                    pu.then((value) {
                      if (value == "OK") {
                        Navigator.of(context).pushNamed("/Fseleccionados");
                      }
                    });
                  }
                });
              },
            ),
          )
        ],
      ),
    ),
  );
}

Widget _buildList(BuildContext context) {
  return new Container(
      width: 370,
      height: 550,
      child: new SingleChildScrollView(
        child: new Column(
          children: favoresS.map((f) {
            return _buildFavorInfo(f, context);
          }).toList(),
        ),
      ));
}
