import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:karma/classes/user_model.dart';

final databaseReference = FirebaseDatabase.instance.reference();
final FirebaseAuth _auth = FirebaseAuth.instance;
get _getFirebaseChatReference => databaseReference.child("fluttermessages");

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

Future<String> addFavor(user_asking, user_toDo, user_askingid, user_toDoid,
    type, details, status, delivery) async {
  try {} catch (error) {
    print('ERRORS');
    print(error.message.toString());
    print(error.code.toString());
    throw Exception(error.message.toString());
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
