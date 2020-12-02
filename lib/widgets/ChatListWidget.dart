import 'package:flutter/material.dart';

import 'ChatItemWidget.dart';
import 'package:karma/backend/firebase_real_time.dart';
import 'package:karma/backend/firebase_auth.dart';

class ChatListWidget extends StatelessWidget {
  final ScrollController listScrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FutureBuilder(
        future: buscarMensajes(su[0]),
        builder: (BuildContext contex, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (men != null) {
              return new Container(
                  width: 370,
                  height: 550,
                  child: new SingleChildScrollView(
                    padding: EdgeInsets.all(10.0),
                    child: new Column(
                      children: men.map((f) {
                        return ChatItemWidget(currentSignedInUser.uid, f);
                      }).toList(),
                    ),
                    reverse: true,
                  ));
            } else {
              return Container(
                child: Text("no se ha mandado ningun mensaje"),
              );
            }

            // ListView.builder(
            //   padding: EdgeInsets.all(10.0),
            //   itemBuilder: (context, index) => ChatItemWidget(index),
            //   itemCount: 4,
            //   reverse: true,
            //   controller: listScrollController,
            // );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
