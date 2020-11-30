import 'package:flutter/material.dart';
import 'package:karma/backend/firebase_real_time.dart';
import 'package:karma/backend/firebase_auth.dart';
import '../backend/firebase_auth.dart';
import '../backend/firebase_real_time.dart';

class AgregarFavor extends StatefulWidget {
  @override
  _AddFavorState createState() => _AddFavorState();
}

class _AddFavorState extends State<AgregarFavor> {
  final _formKey = GlobalKey<FormState>();

  String _title;
  String _description;
  String _location;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 28.0, 0.0, 24.0),
                child: Text(
                  'Pedir un favor',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.green[700],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              titleFormField(),
              SizedBox(height: 20.0),
              descriptionFormField(),
              SizedBox(height: 20.0),
              deliveryPlaceFormField(),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    //agregar favor
                    addFavor(
                        currentSignedInUser.name,
                        "",
                        currentSignedInUser.uid,
                        "",
                        _title,
                        _description,
                        "Inicial",
                        _location);
                    Navigator.of(context).pop();
                  }
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                  child: Text('PEDIR FAVOR'),
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField titleFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onChanged: (value) => _title = value,
      validator: (value) {
        return value.isEmpty ? 'Ingrese un Tipo de favor' : null;
      },
      decoration: InputDecoration(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        hintText: 'Tipo favor',
        helperText: 'Titulo tipo favor',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      maxLength: 50,
      textInputAction: TextInputAction.next,
    );
  }

  TextFormField descriptionFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onChanged: (value) => _description = value,
      validator: (value) {
        return value.isEmpty ? 'Ingrese una descripcion' : null;
      },
      decoration: InputDecoration(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        hintText: 'Descripcion del favor',
        helperText: 'Describe lo que necesitas',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      maxLength: 300,
      textInputAction: TextInputAction.next,
    );
  }

  TextFormField deliveryPlaceFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onChanged: (value) => _location = value,
      validator: (value) {
        return value.isEmpty ? 'Ingresa Sitio de entrega' : null;
      },
      decoration: InputDecoration(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        hintText: 'Sitio de entrega',
        helperText: 'Donde será entregado',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      maxLength: 50,
    );
  }
}
