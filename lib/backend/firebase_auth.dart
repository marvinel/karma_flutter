import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:karma/classes/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final databaseReference = FirebaseDatabase.instance.reference();
final FirebaseAuth _auth = FirebaseAuth.instance;
get _getFirebaseUserReference => databaseReference.child("users");

User currentSignedInUser;

Future<String> signInWithFirebase(email, password) async {
  try {
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    print("OK " + uid);

    await FirebaseDatabase.instance
        .reference()
        .child('users')
        .child(uid)
        .once()
        .then((DataSnapshot snap) {
      Map<dynamic, dynamic> values = snap.value;
      String nombre = values['nombre'];
      String email = values['email'];
      String id = values['id'];
      print(nombre);
      currentSignedInUser = User(email: email, name: nombre, uid: id);
    });

    // DatabaseReference ref = FirebaseDatabase.instance.reference();
    // ref.child('users').child(user.uid).once().then((DataSnapshot snap) {
    //   var keys = snap.value.keys;
    //   var data = snap.value;
    //   for (var key in keys) {
    //     print(data[key]['nombre']);
    //     print(data[key]['id']);
    //     print(data[key]['email']);
    //   }
    // });

    return Future.value("OK");
  } catch (error) {
    print('ERRORS');
    print(error.message.toString());
    print(error.code.toString());
    return Future.error(error.message.toString());
  }
}

Future<String> signUpWithFirebase(email, password, name) async {
  try {} catch (error) {
    print('ERRORS');
    print(error.message.toString());
    print(error.code.toString());
    throw Exception(error.message.toString());
  }
  final FirebaseUser user = await _auth.currentUser();
  final uid = user.uid;
  print('signUpWithFirebase Ok with uid ' + uid);

  currentSignedInUser = User(email: email, name: name, uid: uid);

  databaseReference.child("users").child(user.uid).set({
    'id': user.uid,
    'nombre': currentSignedInUser.name,
    'email': user.email
  });
  //await db
  //.collection('/users')
  //.document(uid)
  //.setData(currentSignedInUser.toMap());

  return Future.value("OK");
}

Future<bool> signOutFirebase() async {
  currentSignedInUser = null;
  await _auth.signOut();
  return true;
}
