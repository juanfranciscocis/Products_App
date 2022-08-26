
import 'package:flutter/material.dart';
import 'package:products_app/ui/input_decoration.dart';
import 'package:products_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBackgroundWidget(
        child: SingleChildScrollView(child: _LoginForm(context:context)),
      ),
    );
  }

  Column _LoginForm({required BuildContext context}) {
    return Column(
        children: [
          SizedBox(height: 200),
          CardContainerWidget(
              child: _LoginFields(context: context)
          ),
          SizedBox(height: 20),
          Text('Create an account', style: TextStyle(color: Colors.indigo,fontSize: 18, fontWeight: FontWeight.w600)),
        ],
      );
  }

  Column _LoginFields({required BuildContext context}) {
    return Column(

      children: [
        SizedBox( height: 10,),
        Text('Login', style: Theme.of(context).textTheme.headline4,),
        SizedBox( height: 30,),


        Container(
          //TODO: MATENER REFERENCIA AL KEY
          child: Form(
            child: Column(
              children:[
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.decoration(icon: Icons.alternate_email, labelText: 'Email', hintText: 'Enter your email'),
                ),
                SizedBox(height: 30,),
                TextFormField(
                  obscureText: true,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.decoration(icon: Icons.lock,  labelText: 'Password', hintText: 'Enter your password'),
                ),
                SizedBox(height: 30,),
                MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  color: Colors.deepPurple,
                    elevation: 10,
                    child: Container(
                      child: Center(child: Text('Login', style: TextStyle(color: Colors.white),)),
                      height: 50,
                      width: 80,
                    ),

                    onPressed: (){
                      Navigator.pushNamed(context, '/home');
                    }
                )
              ]
            ),
          ),
        )



      ],

    );
  }
}

