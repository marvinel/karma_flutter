import 'package:flutter/material.dart';
import 'package:karma/pages/constants.dart';
import 'package:karma/backend/firebase_auth.dart';

class Registro extends StatefulWidget {
  Registro({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyRegistroPageState createState() => _MyRegistroPageState();
}

class _MyRegistroPageState extends State<Registro> {
  bool _registered = false;
  String email, name, password, password2;
  Widget _buildLogo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 200,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/karmalogo2.png'))),
        )
      ],
    );
  }

  Widget _buildEmail() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: mainColor,
            ),
            labelText: 'E-mail'),
      ),
    );
  }

  Widget _buildName() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.name,
        onChanged: (value) {
          setState(() {
            name = value;
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: mainColor,
            ),
            labelText: 'Nombre'),
      ),
    );
  }

  Widget _buildPassword() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: mainColor,
            ),
            labelText: 'Password'),
      ),
    );
  }

  Widget _buildPasswordVerify() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            password2 = value;
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: mainColor,
            ),
            labelText: 'Repeat Password'),
      ),
    );
  }

  Widget _registerButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            height: 1.4 * (MediaQuery.of(context).size.height / 20),
            width: 5 * (MediaQuery.of(context).size.width / 10),
            margin: EdgeInsets.only(bottom: 20),
            child: RaisedButton(
              elevation: 5.0,
              color: mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () {
                _status();
                Future<String> res = "OK";
                if (signUpWithFirebase(email, password, name) == res.value()) {
                  Navigator.of(context).pushNamed("/login");
                }
              },
              child: Text(
                "Registro",
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontSize: MediaQuery.of(context).size.height / 40),
              ),
            ))
      ],
    );
  }

  void _status() {
    setState(() {
      _registered = true;
    });
  }

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Registro",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 30,
                          ))
                    ],
                  ),
                  _buildEmail(),
                  _buildName(),
                  _buildPassword(),
                  _buildPasswordVerify(),
                  _registerButton()
                ],
              )),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width,
          child: Container(
              decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(70),
                    bottomRight: const Radius.circular(70),
                  ))),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[_buildLogo(), _buildContainer()],
        )
      ]

          /*Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/karmalogo2.png'))),
            ),
            RaisedButton(
                child: Text("Iniciar sesion"),
                onPressed: () {
                  _status();
                  Navigator.of(context).pushNamed("/home");
                }),
            RaisedButton(
                child: Text("Resgistro"),
                onPressed: () {
                  Navigator.of(context).pushNamed("/registro");
                }),
            Text(
              '$_logged',
              style: Theme.of(context).textTheme.display1,
            )
          ],
        ),*/
          ),
      // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}
