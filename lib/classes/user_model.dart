import 'package:flutter/foundation.dart';

class User {
  final String email;
  final String name;
  final String uid;
  final int karma;

  User({
    @required this.email,
    @required this.name,
    @required this.uid,
    @required this.karma,
  });

  Map<String, dynamic> toMap() {
    return {'email': email, 'name': name, 'karma': karma};
  }

  factory User.fromMap(String uid, Map<String, dynamic> map) {
    assert(uid != null);
    assert(map != null);
    return User(
      email: map['email'],
      name: map['name'],
      karma: map['karma'],
      uid: uid,
    );
  }
}
