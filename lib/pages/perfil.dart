import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'constants.dart';
import 'package:karma/backend/firebase_auth.dart';
import 'package:karma/backend/firebase_real_time.dart';

class Perfil extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<Perfil> {
  bool _status = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text('Perfil'),
      ),
      body: FutureBuilder(
        future: obtenerHistorial(),
        builder: (BuildContext contex, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (historial.isNotEmpty) {
              return Stack(
                children: <Widget>[
                  new Container(
                    color: Colors.white,
                    child: new ListView(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            new Container(
                              height: 170.0,
                              color: Colors.white,
                              child: new Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.0),
                                    child: new Stack(
                                        fit: StackFit.loose,
                                        children: <Widget>[
                                          new Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              new Container(
                                                  width: 140.0,
                                                  height: 140.0,
                                                  decoration: new BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: new DecorationImage(
                                                      image: new ExactAssetImage(
                                                          'assets/profile.png'),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 90.0, right: 100.0),
                                              child: new Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  new CircleAvatar(
                                                    backgroundColor:
                                                        Colors.green[300],
                                                    radius: 25.0,
                                                    child: new Icon(
                                                      Icons.camera_alt,
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ],
                                              )),
                                        ]),
                                  )
                                ],
                              ),
                            ),
                            new Container(
                              color: Color(0xffFFFFFF),
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 25.0),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 25.0),
                                        child: new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                new Text(
                                                  'Informacion personal',
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 25.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                child: new Text(
                                                  'Nombre',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              flex: 2,
                                            ),
                                            Expanded(
                                              child: Container(
                                                child: new Text(
                                                  'Karma',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              flex: 2,
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 2.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    right: 10.0),
                                                child: new Text(
                                                  currentSignedInUser.name,
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ),
                                              flex: 3,
                                            ),
                                            Expanded(
                                              child: new Text(
                                                currentSignedInUser.karma
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              flex: 3,
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 25.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                new Text(
                                                  'Email',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 2.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Flexible(
                                              child: new Text(
                                                currentSignedInUser.email,
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 25.0),
                                        child: new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                new Text(
                                                  'Historial de pedidos',
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        new Container(
                            width: 370,
                            height: 250,
                            child: new SingleChildScrollView(
                              child: new Column(
                                children: historial.map((f) {
                                  return Container(
                                    width: 370,
                                    height: 180,
                                    child: Card(
                                      color: Colors.deepPurple[900],
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 15),
                                          Text(
                                            "Tipo Favor: " + f.type,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "Estado: " + f.status,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "Usuario: " + f.user_asking,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "Detalles: " + f.details,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            "Punto Entrega:" + f.delivery,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Stack(
                children: <Widget>[
                  new Container(
                    color: Colors.white,
                    child: new ListView(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            new Container(
                              height: 170.0,
                              color: Colors.white,
                              child: new Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.0),
                                    child: new Stack(
                                        fit: StackFit.loose,
                                        children: <Widget>[
                                          new Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              new Container(
                                                  width: 140.0,
                                                  height: 140.0,
                                                  decoration: new BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: new DecorationImage(
                                                      image: new ExactAssetImage(
                                                          'assets/profile.png'),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 90.0, right: 100.0),
                                              child: new Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  new CircleAvatar(
                                                    backgroundColor:
                                                        Colors.green[300],
                                                    radius: 25.0,
                                                    child: new Icon(
                                                      Icons.camera_alt,
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ],
                                              )),
                                        ]),
                                  )
                                ],
                              ),
                            ),
                            new Container(
                              color: Color(0xffFFFFFF),
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 25.0),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 25.0),
                                        child: new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                new Text(
                                                  'Informacion personal',
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 25.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                child: new Text(
                                                  'Nombre',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              flex: 2,
                                            ),
                                            Expanded(
                                              child: Container(
                                                child: new Text(
                                                  'Karma',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              flex: 2,
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 2.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    right: 10.0),
                                                child: new Text(
                                                  currentSignedInUser.name,
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ),
                                              flex: 3,
                                            ),
                                            Expanded(
                                              child: new Text(
                                                currentSignedInUser.karma
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              flex: 3,
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 25.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                new Text(
                                                  'Email',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 2.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Flexible(
                                              child: new Text(
                                                currentSignedInUser.email,
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 25.0),
                                        child: new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                new Text(
                                                  'Historial de pedidos',
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Text("No se ha encontrado ningun historial"),
                        )
                      ],
                    ),
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
    );
  }
}
