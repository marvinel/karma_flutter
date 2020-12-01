import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:karma/classes/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

final databaseReference = FirebaseDatabase.instance.reference();
final FirebaseAuth _auth = FirebaseAuth.instance;

User currentSignedInUser;

Future<String> signInWithFirebase(String email, String password) async {
  try {
    AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    print("el Resultado fue");
    print(result);
    final FirebaseUser user = await _auth.currentUser();
    print(user);
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
      int karma = values['karma'];
      int favor = values['favor'];
      currentSignedInUser =
          User(email: email, name: nombre, uid: id, karma: karma, favor: favor);
    });
    return Future.value("OK");
  } catch (error) {
    print('ERRORS');
    print(error.toString());
    return Future.value(error.toString());
  }
}

Future<String> cambiarKarma() async {
  await FirebaseDatabase.instance
      .reference()
      .child("users")
      .child(currentSignedInUser.uid)
      .set({
    'id': currentSignedInUser.uid,
    'nombre': currentSignedInUser.name,
    'email': currentSignedInUser.email,
    'karma': currentSignedInUser.karma - 2,
    'favor': currentSignedInUser.favor - 1
  });
  User currentSignedInUse = User(
      email: currentSignedInUser.email,
      name: currentSignedInUser.name,
      uid: currentSignedInUser.uid,
      karma: currentSignedInUser.karma - 2,
      favor: currentSignedInUser.favor - 1);
  currentSignedInUser = currentSignedInUse;

  return Future.value("OK");
}

Future<String> cambiarKarma2(String asking, String todoit) async {
  await FirebaseDatabase.instance
      .reference()
      .child('users')
      .child(asking)
      .once()
      .then((DataSnapshot snap) {
    Map<dynamic, dynamic> values = snap.value;
    String nombre = values['nombre'];
    String email = values['email'];
    String id = values['id'];
    int karma = values['karma'];
    int favor = values['favor'];
    currentSignedInUser =
        User(email: email, name: nombre, uid: id, karma: karma, favor: favor);
  });
  await FirebaseDatabase.instance.reference().child("users").child(asking).set({
    'id': currentSignedInUser.uid,
    'nombre': currentSignedInUser.name,
    'email': currentSignedInUser.email,
    'karma': currentSignedInUser.karma,
    'favor': currentSignedInUser.favor + 1,
  });

  await FirebaseDatabase.instance
      .reference()
      .child('users')
      .child(todoit)
      .once()
      .then((DataSnapshot snap) {
    Map<dynamic, dynamic> values = snap.value;
    String nombre = values['nombre'];
    String email = values['email'];
    String id = values['id'];
    int karma = values['karma'];
    int favor = values['favor'];
    currentSignedInUser =
        User(email: email, name: nombre, uid: id, karma: karma, favor: favor);
  });
  await FirebaseDatabase.instance
      .reference()
      .child("users")
      .child(currentSignedInUser.uid)
      .set({
    'id': currentSignedInUser.uid,
    'nombre': currentSignedInUser.name,
    'email': currentSignedInUser.email,
    'karma': currentSignedInUser.karma + 2,
    'favor': currentSignedInUser.favor,
  });
  User currentSignedInUse = User(
      email: currentSignedInUser.email,
      name: currentSignedInUser.name,
      uid: currentSignedInUser.uid,
      karma: currentSignedInUser.karma + 2,
      favor: currentSignedInUser.favor);
  currentSignedInUser = currentSignedInUse;

  return Future.value("OK");
}

Future<String> signUpWithFirebase(
    String email, String password, String name) async {
  try {
    AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    print("el Resultado fue");
    print(result);
    final FirebaseUser user = await _auth.currentUser();

    print("token del usuario" + user.uid);
    final uid = user.uid;
    print('signUpWithFirebase Ok with uid ' + uid);

    currentSignedInUser =
        User(email: email, name: name, uid: uid, karma: 2, favor: 1);

    databaseReference.child("users").child(user.uid).set({
      'id': user.uid,
      'nombre': currentSignedInUser.name,
      'email': user.email,
      'karma': currentSignedInUser.karma,
      'favor': currentSignedInUser.favor
    });
    return Future.value("OK");
  } catch (error) {
    print('ERRORS');
    print(error.toString());
    throw Exception(error.toString());
  }
}

Future<bool> signOutFirebase() async {
  currentSignedInUser = null;
  await _auth.signOut();
  return true;
}
