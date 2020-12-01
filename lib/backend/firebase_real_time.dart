import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:karma/classes/favor.dart';

import '../classes/favor.dart';
import 'firebase_auth.dart';

final databaseReference = FirebaseDatabase.instance.reference();
final FirebaseAuth _auth = FirebaseAuth.instance;
// ignore: unused_element
get _getFirebaseChatReference => databaseReference.child("fluttermessages");

Favor favoresP;
List<Favor> favoresL;
List<Favor> favoresS;

Future<String> sendChatMsg(String text) async {
  try {
    var firebaseUser = await _auth.currentUser();
    final FirebaseUser user = firebaseUser;
    final uid = user.uid;
    databaseReference
        .child("fluttermessages")
        .push()
        .set({'text': text, 'user': uid});
  } catch (error) {
    print('ERRORS');
    print(error.message.toString());
    print(error.code.toString());
    return Future.error(error.message.toString());
  }
  return Future.value("OK");
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
  print(currentSignedInUser.uid);
  values.forEach((key, value) {
    if (value['user_toDoid'] == currentSignedInUser.uid &&
        value['status'] == 'Asignado') {
      fav.add(Favor(
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
  favoresS = fav;
  return "OK";
}

Future<String> listaPedidos() async {
  List<Favor> fa = [];
  Map<dynamic, dynamic> values;
  await databaseReference.child('favores').once().then((DataSnapshot snap) {
    values = snap.value;
  });
  print(currentSignedInUser.uid);
  values.forEach((key, value) {
    if (value['user_askingid'] != currentSignedInUser.uid &&
        value['status'] == 'Inicial') {
      fa.add(Favor(
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
  favoresL = fa;
  return "OK";
}

Future<String> obtenerFavorPedido() async {
  Map<dynamic, dynamic> values;
  favoresP = Favor(
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
  values.forEach((key, value) {
    if (value['user_askingid'] == currentSignedInUser.uid &&
        value['status'] == 'Inicial') {
      favoresP = Favor(
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
  return "OK";
}

Future<String> updateFavor(favor) async {
  try {} catch (error) {
    print('ERRORS');
    print(error.message.toString());
    print(error.code.toString());
    throw Exception(error.message.toString());
  }
  if (favor != null) {
    databaseReference.child("favores").child(favor.key).set(favor.toJson());
  }

  return Future.value("OK");
}
