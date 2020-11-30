import 'package:flutter/foundation.dart';

class Favor {
  // ignore: non_constant_identifier_names
  final String user_asking;
  // ignore: non_constant_identifier_names
  final String user_toDo;
  // ignore: non_constant_identifier_names
  final String user_askingid;
  // ignore: non_constant_identifier_names
  final String user_toDoid;
  final String type;
  final String details;
  final String status;
  final String delivery;

  Favor({
    // ignore: non_constant_identifier_names
    @required this.user_asking,
    // ignore: non_constant_identifier_names
    @required this.user_toDo,
    // ignore: non_constant_identifier_names
    @required this.user_askingid,
    // ignore: non_constant_identifier_names
    @required this.user_toDoid,
    @required this.type,
    @required this.details,
    @required this.status,
    @required this.delivery,
  });

  Map<String, dynamic> toMap() {
    return {
      'user_asking': user_asking,
      'user_toDo': user_toDo,
      'user_askingid': user_askingid,
      'user_toDoid': user_toDoid,
      'type': type,
      'details': details,
      'status': status,
      'delivery': delivery
    };
  }

  factory Favor.fromMap(String uid, Map<String, dynamic> map) {
    assert(uid != null);
    assert(map != null);
    return Favor(
        user_asking: map['user_asking'],
        user_toDo: map['user_toDo'],
        user_askingid: map['user_askingid'],
        user_toDoid: map['user_toDoid'],
        type: map['type'],
        details: map['details'],
        status: map['status'],
        delivery: map['delivery']);
  }
}
