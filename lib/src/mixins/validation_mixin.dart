import 'package:flutter/material.dart';

class ValidationMixin {
  String validateEmail(String value) {
    if(!value.contains('@')) {
      return 'Please enter a valid Email.';
    }

    return null;
  }
  
  String validatePassword(String value) {
    if(value.length < 4) {
      return 'Please must be at least 4 characters.';
    }

    return null;
  }
}