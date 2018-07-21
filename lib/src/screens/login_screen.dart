import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return _LoginScreenState();
    }
}

class _LoginScreenState extends State<LoginScreen> {
  @override
    Widget build(BuildContext context) {
      return Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: <Widget>[
              emailField(),
              // passwordField(),
              // submitButton(),
            ],
          ),
        ),
      );
    }

    Widget emailField() {
      return TextFormField(
        decoration: InputDecoration(
          labelText: 'Email Address',
          hintText: 'you@example.com',
        ),
        keyboardType: TextInputType.emailAddress,
      );
    }

    Widget passwordField() {

    }

    Widget submitButton() {

    }
}