import 'package:flutter/material.dart';

import 'screens/screens.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  //CONSTRUCTOR
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }




}