

import 'package:flutter/material.dart';

class InputDecorations{

  static InputDecoration decoration({
  required String labelText,
  required String hintText,
  required IconData icon,
}){
    return InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.indigo),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.indigo),
      ),
      hintText: hintText,
      prefixIcon: Icon(icon, color: Colors.deepPurple,),
    );
  }
}