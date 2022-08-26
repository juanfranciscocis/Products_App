import 'package:flutter/material.dart';
import 'package:products_app/providers/login_form_provider.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => LoginFormProvider()),
  ], child: const MyApp()));
}



class MyApp extends StatelessWidget{
  //CONSTRUCTOR
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[300],
      ),
      title: 'Material App',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }




}