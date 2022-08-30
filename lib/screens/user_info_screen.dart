import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';
import 'login_screen.dart';

class UserInfoScreen extends StatelessWidget{
  const UserInfoScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(onPressed: () {
              authService.logout();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => LoginScreen()),
                      (route) => false
              );
            }, icon: Icon(Icons.logout, size: 60,),)
          ],
        ),
      ),
    );
  }
}