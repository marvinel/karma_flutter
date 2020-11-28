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

Future<String> addFavor(status, name, details, deliveryPoint) async {
  try {} catch (error) {
    print('ERRORS');
    print(error.message.toString());
    print(error.code.toString());
    throw Exception(error.message.toString());
  }
  final FirebaseUser user = await _auth.currentUser();
  final uid = user.uid;
  print(' User Info ' + uid);

  databaseReference.child("favores").child(user.uid).set({
    'name': name,
    'personAsking': user.uid,
    'details': details,
    'status': status,
    'deliveryPoint': deliveryPoint
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
