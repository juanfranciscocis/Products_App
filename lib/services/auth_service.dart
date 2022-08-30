
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier{

  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyBdQnTxVLhM-z69_YQ6_qoZ2Odx2sHnr6I';

  //SI REGRESO ALGO, ES QUE EL USUARIO EXISTE SI NO, ES QUE NO EXISTE Y LO CREO
  Future<String?> createUser(String email, String password) async{

    final Map<String,dynamic> authData = {
      "email": email,
      "password": password,
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signUp', {
      'key': _firebaseToken,
    });

    final response = await http.post(url, body: json.encode(authData));

    final Map<String,dynamic> decodedResponse = json.decode(response.body);


    if(decodedResponse.containsKey('idToken')) {
      return null;
    } else {
      return decodedResponse['error']['message'];
    }


  }

  //SI REGRESO ALGO, ES QUE EL USUARIO EXISTE SI NO, ES QUE NO EXISTE Y LO CREO
  Future<String?> loginUser(String email, String password) async{

    final Map<String,dynamic> authData = {
      "email": email,
      "password": password,
    };

    final url = Uri.https(_baseUrl, 'v1/accounts:signInWithPassword', {
      'key': _firebaseToken,
    });

    final response = await http.post(url, body: json.encode(authData));

    final Map<String,dynamic> decodedResponse = json.decode(response.body);


    if(decodedResponse.containsKey('idToken')) {
      return null;
    } else {
      return decodedResponse['error']['message'];
    }


  }



}