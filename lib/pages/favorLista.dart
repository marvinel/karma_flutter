import 'package:flutter/material.dart';
import 'package:karma/pages/constants.dart';
import '../backend/firebase_real_time.dart';
import 'constants.dart';
import 'package:karma/classes/favor.dart';
import 'package:karma/backend/firebase_auth.dart';
import 'package:karma/backend/firebase_real_time.dart';

class FLista extends StatefulWidget {
  @override
  _FlistaState createState() => _FlistaState();
}

class _FlistaState extends State<FLista> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
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
          future: listaPedidos(),
          builder: (BuildContext contex, AsyncSnapshot some) {
            if (some.hasData) {
              if (favoresL.isEmpty) {
                return Stack(
                  children: <Widget>[
                    Container(decoration: BoxDecoration()),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        _buildRadioButtons(),
                        _buildOptions(),
                        Container(
                          child: Text(
                              'No se encuentra ningun favor para seleccionar'),
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
                        _buildRadioButtons(),
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
      Expanded(
        flex: 1,
        child: Radio(value: 1, groupValue: id, onChanged: null),
      ),
      Expanded(
        flex: 2,
        child: Text("Sacar Copias"),
      ),
      Expanded(
        flex: 1,
        child: Radio(value: 1, groupValue: id, onChanged: null),
      ),
      Expanded(
        flex: 2,
        child: Text("Comprar Km5"),
      ),
      Expanded(
        flex: 1,
        child: Radio(value: 1, groupValue: id, onChanged: null),
      ),
      Expanded(
        flex: 2,
        child: Text("Domicilio P7"),
      ),
    ],
  );
}

Widget _buildFavorInfo(Favor f, BuildContext context) {
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
            "Punto Entrega:" + f.delivery,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 10),
          Container(
            width: 330,
            child: RaisedButton(
              child: Text(
                "Tomar",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.green,
              onPressed: () {
                Future<String> ff = updateFavor(f);
                ff.then((val) {
                  if (val == "OK") {
                    Navigator.of(context).pushNamed("/Flista");
                  }
                });
              },
            ),
          ),
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
          children: favoresL.map((f) {
            return _buildFavorInfo(f, context);
          }).toList(),
        ),
      ));
}
