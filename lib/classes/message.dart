import 'package:flutter/foundation.dart';

class Messages {
  final String mensaje;
  final String user;
  final String destiny;

  Messages({
    @required this.mensaje,
    @required this.user,
    @required this.destiny,
  });

  Map<String, dynamic> toMap() {
    return {'mensaje': mensaje, 'user': user, 'destiny': destiny};
  }

  factory Messages.fromMap(Map<String, dynamic> map) {
    assert(map != null);
    return Messages(
      mensaje: map['mensaje'],
      user: map['user'],
      destiny: map['destiny'],
    );
  }
}
