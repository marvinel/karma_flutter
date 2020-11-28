import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:karma/classes/favor.dart';
import 'package:karma/pages/constants.dart';
import 'package:karma/backend/firebase_auth.dart';
import 'constants.dart';

class Fpedido extends StatelessWidget {
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
                // _buildList(),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: _buildPedir(),
                )
              ],
            ),
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

Widget _buildPedir() {
  return Container(
    alignment: Alignment.center,
    child: RaisedButton(
      child: Text(
        "Pedir favor",
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.green,
      onPressed: () {},
    ),
  );
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

// Widget _buildFavorInfo(Favor) {
//   return Container(
//     width: 370,
//     height: 230,
//     child: Card(
//       color: Colors.deepPurple[900],
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(height: 15),
//           Text(
//             Favor.name,
//             style: TextStyle(color: Colors.white, fontSize: 22),
//           ),
//           SizedBox(height: 10),
//           Text(
//             Favor.status,
//             style: TextStyle(color: Colors.white, fontSize: 16),
//           ),
//           SizedBox(height: 10),
//           Text(
//             Favor.personAsking,
//             style: TextStyle(color: Colors.white, fontSize: 16),
//           ),
//           SizedBox(height: 10),
//           Text(
//             Favor.details,
//             style: TextStyle(color: Colors.white, fontSize: 16),
//           ),
//           SizedBox(height: 10),
//           Text(
//             Favor.deliveryPoint,
//             style: TextStyle(color: Colors.white, fontSize: 16),
//           ),
//           SizedBox(height: 10),
//           Container(
//             width: 330,
//             child: RaisedButton(
//               child: Text(
//                 "Chat",
//                 style: TextStyle(color: Colors.white),
//               ),
//               color: Colors.green,
//               onPressed: () {},
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget _buildList() {
//   List<Favor> favores = [
//     Favor(
//         name: 'Bill Will',
//         personAsking: 'djnhdkidk',
//         details: "Software Developer",
//         deliveryPoint: "jdkddkl",
//         status: "dhsksn"),
//     Favor(
//         name: 'Jhoner Pineda',
//         personAsking: 'Marvin',
//         details: "Software Developer",
//         deliveryPoint: "p7",
//         status: "1")
//   ];
//   return Column(
//     children: favores.map((f) {
//       return _buildFavorInfo(f);
//     }).toList(),
//   );
// }
