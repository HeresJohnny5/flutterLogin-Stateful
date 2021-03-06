import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

// this creates the widget which is show on the screen of the device. This widget gets created and thrown away every time the application is rendered
class LoginScreen extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return _LoginScreenState();
    }
}

// this creates the login data that is persisted to hold the values 
class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  
  String email = '';
  String password = '';

  @override
    Widget build(BuildContext context) {
      return Container(
        margin: EdgeInsets.all(20.0),
        child: Form( // Form is a instance variable that behind the scenes also acts as a StatefulWidget i.e. FormState
          key: formKey, // this associates the GlobalKey with the Form widget. The Form widget will reference the FormState that is created when the LoginScreenState appears on the user's screen. This will grant you access to the properties and methods of FormState
          child: Column(
            children: <Widget>[
              emailField(),
              passwordField(),
              SizedBox(
                height: 25.0, // this will create a modular solution which will make any refactore more easy
              ),
              submitButton(),
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
        keyboardType: TextInputType.emailAddress, // emailAddress is a constant of the TextFormField class
        validator: validateEmail,
        onSaved: (String value) {
          email = value;
        },
      );
    }

    Widget passwordField() {
      return TextFormField(
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Password',
        ),
        obscureText: true, // sets the password fields to bullet points
        validator: validatePassword,
        onSaved: (String value) {
          password = value;
        },
      );
    }

    Widget submitButton() {
      return RaisedButton(
        child: Text('Submit'),
        color: Colors.green[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)
        ),
        onPressed: () {
          if(formKey.currentState.validate()) { // currentState is the FormState instance
            formKey.currentState.save();
            print('Time to post $email and $password to API');
          } 
        },
      );
    }
}