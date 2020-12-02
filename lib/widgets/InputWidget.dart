import 'package:flutter/material.dart';
import 'package:karma/config/Palette.dart';
import 'package:karma/backend/firebase_auth.dart';
import 'package:karma/backend/firebase_real_time.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController textEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 1.0),
              child: new IconButton(
                icon: new Icon(Icons.face),
                color: Colors.green,
                onPressed: () {
                  print("SE PRESIONO ESTOOO");
                },
              ),
            ),
            color: Colors.white,
          ),

          // Text input
          Flexible(
            child: Container(
              child: TextField(
                style: TextStyle(color: Colors.black, fontSize: 15.0),
                controller: textEditingController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type a message',
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),

          // Send Message Button
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 8.0),
              child: new IconButton(
                icon: new Icon(
                  Icons.send,
                  color: Colors.green,
                ),
                onPressed: () {
                  enviarMensaje(su[0], su[1], textEditingController.text);
                  textEditingController.text = "";
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed("/chat");
                },
                color: Palette.primaryColor,
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration: new BoxDecoration(
          border: new Border(
              top: new BorderSide(color: Palette.greyColor, width: 0.5)),
          color: Colors.white),
    );
  }
}
