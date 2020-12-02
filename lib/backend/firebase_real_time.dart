import 'package:firebase_database/firebase_database.dart';
import 'package:karma/classes/favor.dart';
import 'package:karma/classes/message.dart';

import '../classes/favor.dart';
import 'firebase_auth.dart';

final databaseReference = FirebaseDatabase.instance.reference();

Favor favoresP;
List<Favor> favoresL;
List<Favor> favoresS;
List<Favor> historial;
List<Messages> men;

Future<String> enviarMensaje(
    String usuario, String destino, String mensaje) async {
  await FirebaseDatabase.instance
      .reference()
      .child("mensajes")
      .push()
      .set({'usuario': usuario, 'mensaje': mensaje, 'destino': destino});
  return Future.value("OK");
}

Future<String> buscarMensajes(user) async {
  List<Messages> mensa = [];
  Map<dynamic, dynamic> values;
  await databaseReference.child('mensajes').once().then((DataSnapshot snap) {
    values = snap.value;
  });
  if (values != null) {
    values.forEach((key, value) {
      if (value['destino'] == user || value['usuario'] == user) {
        print(value['mensaje']);
        mensa.add(Messages(
            user: value['usuario'],
            mensaje: value['mensaje'],
            destiny: value['destino']));
      }
    });
  }
  print(user);
  men = mensa;
  print("los mensajes son");
  print(men);
  return "OK";
}

// ignore: non_constant_identifier_names
Future<String> addFavor(user_asking, user_toDo, user_askingid, user_toDoid,
    type, details, status, delivery) async {
  try {} catch (error) {
    print('ERRORS');
    print(error.toString());
  }
  databaseReference.child("favores").push().set({
    'user_asking': user_asking,
    'user_toDo': user_toDo,
    'user_askingid': user_askingid,
    'user_toDoid': user_toDoid,
    'type': type,
    'details': details,
    'status': status,
    'delivery': delivery,
  });
  return Future.value("OK");
}

Future<String> listaSeleccionados() async {
  List<Favor> fav = [];
  Map<dynamic, dynamic> values;
  await databaseReference.child('favores').once().then((DataSnapshot snap) {
    values = snap.value;
  });
  if (values != null) {
    values.forEach((key, value) {
      if (value['user_toDoid'] == currentSignedInUser.uid &&
          value['status'] == 'Asignado') {
        fav.add(Favor(
            key: key,
            user_asking: value['user_asking'],
            user_toDo: value['user_toDo'],
            user_askingid: value['user_askingid'],
            user_toDoid: value['user_toDoid'],
            type: value['type'],
            details: value['details'],
            status: value['status'],
            delivery: value['delivery']));
      }
    });
  }

  favoresS = fav;
  return "OK";
}

Future<String> listaPedidos() async {
  List<Favor> fa = [];
  Map<dynamic, dynamic> values;
  await databaseReference.child('favores').once().then((DataSnapshot snap) {
    values = snap.value;
  });
  if (values != null) {
    values.forEach((key, value) {
      if (value['user_askingid'] != currentSignedInUser.uid &&
          value['status'] == 'Inicial') {
        fa.add(Favor(
            key: key,
            user_asking: value['user_asking'],
            user_toDo: value['user_toDo'],
            user_askingid: value['user_askingid'],
            user_toDoid: value['user_toDoid'],
            type: value['type'],
            details: value['details'],
            status: value['status'],
            delivery: value['delivery']));
      }
    });
  }

  favoresL = fa;
  return "OK";
}

Future<String> obtenerHistorial() async {
  List<Favor> h = [];
  Map<dynamic, dynamic> values;
  await databaseReference.child('favores').once().then((DataSnapshot snap) {
    values = snap.value;
  });
  if (values != null) {
    values.forEach((key, value) {
      if (value['user_askingid'] == currentSignedInUser.uid ||
          value['user_toDoid'] == currentSignedInUser.uid) {
        h.add(Favor(
            key: key,
            user_asking: value['user_asking'],
            user_toDo: value['user_toDo'],
            user_askingid: value['user_askingid'],
            user_toDoid: value['user_toDoid'],
            type: value['type'],
            details: value['details'],
            status: value['status'],
            delivery: value['delivery']));
      }
    });
    List<Favor> h2 = [];
    if (h.length >= 3) {
      var i = 1;
      while (i <= 3) {
        h2.add(h[h.length - i]);
        i = i + 1;
      }
      historial = h2;
    } else {
      var i = 1;
      while (i <= h.length) {
        h2.add(h[h.length - i]);
        i = i + 1;
      }
      historial = h2;
    }
  }
  return "OK";
}

Future<String> obtenerFavorPedido() async {
  Map<dynamic, dynamic> values;
  favoresP = Favor(
      key: null,
      user_asking: null,
      user_toDo: null,
      user_askingid: null,
      user_toDoid: null,
      type: null,
      details: null,
      status: null,
      delivery: null);
  await databaseReference.child('favores').once().then((DataSnapshot snap) {
    values = snap.value;
  });
  if (values != null) {
    values.forEach((key, value) {
      if (value['user_askingid'] == currentSignedInUser.uid &&
          value['status'] != 'Completado') {
        favoresP = Favor(
            key: key,
            user_asking: value['user_asking'],
            user_toDo: value['user_toDo'],
            user_askingid: value['user_askingid'],
            user_toDoid: value['user_toDoid'],
            type: value['type'],
            details: value['details'],
            status: value['status'],
            delivery: value['delivery']);
      }
    });
  }
  return "OK";
}

Future<String> updateFavor(favor) async {
  if (favor != null) {
    databaseReference.child("favores").child(favor.key).set({
      'user_asking': favor.user_asking,
      'user_toDo': currentSignedInUser.name,
      'user_askingid': favor.user_askingid,
      'user_toDoid': currentSignedInUser.uid,
      'type': favor.type,
      'details': favor.details,
      'status': 'Asignado',
      'delivery': favor.delivery,
    });
  }
  return Future.value("OK");
}

Future<String> updateFavor2(favor) async {
  if (favor != null) {
    databaseReference.child("favores").child(favor.key).set({
      'user_asking': favor.user_asking,
      'user_toDo': currentSignedInUser.name,
      'user_askingid': favor.user_askingid,
      'user_toDoid': currentSignedInUser.uid,
      'type': favor.type,
      'details': favor.details,
      'status': 'Completado',
      'delivery': favor.delivery,
    });
  }
  return Future.value("OK");
}
