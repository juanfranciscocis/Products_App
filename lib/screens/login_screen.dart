
import 'package:flutter/material.dart';
import 'package:products_app/providers/login_form_provider.dart';
import 'package:products_app/ui/input_decoration.dart';
import 'package:products_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget{



  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final loginProvider = Provider.of<LoginFormProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: LoginBackgroundWidget(
        child: SingleChildScrollView(child: _LoginForm(context:context, loginProvider: loginProvider)),
      ),
    );
  }

  Column _LoginForm({required BuildContext context, required LoginFormProvider loginProvider}) {
    return Column(
        children: [
          SizedBox(height: 200),
          CardContainerWidget(
              child: _LoginFields(context: context, loginProvider: loginProvider),
          ),
          SizedBox(height: 20),
          Text('Create an account', style: TextStyle(color: Colors.indigo,fontSize: 18, fontWeight: FontWeight.w600)),
        ],
      );
  }

  Column _LoginFields({required BuildContext context, required LoginFormProvider loginProvider}) {
    
    return Column(

      children: [
        SizedBox( height: 10,),
        Text('Login', style: Theme.of(context).textTheme.headline4,),
        SizedBox( height: 30,),


        Container(
          child: Form(
            key: loginProvider.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children:[
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.decoration(icon: Icons.alternate_email, labelText: 'Email', hintText: 'Enter your email'),
                  validator: (value){
                    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp  = new RegExp(pattern);
                    return regExp.hasMatch(value!) ? null : 'Invalid email';
                  },
                  onChanged: (value){
                    loginProvider.setEmail(value);
                  },
                ),
                SizedBox(height: 30,),
                TextFormField(
                  obscureText: true,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.decoration(icon: Icons.lock,  labelText: 'Password', hintText: 'Enter your password'),
                  validator: (value){
                    if(value != null && value.length >= 8){
                      return null;
                    }
                    return 'Invalid password (min 8 characters)';
                  },
                  onChanged: (value){
                    loginProvider.setPassword(value);
                  },
                ),
                SizedBox(height: 30,),
                MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  color: Colors.deepPurple,
                    elevation: 10,
                    child: Container(
                      child: Center(child: Text(loginProvider.isLoading? 'Wait': 'Login', style: TextStyle(color: Colors.grey),)),
                      height: 60,
                      width: 60,
                    ),

                    onPressed: loginProvider.isLoading ? null : ()async{
                      FocusScope.of(context).unfocus();

                      if(loginProvider.isValidForm() == true){

                        loginProvider.isLoading = true;

                        await Future.delayed(Duration(seconds: 2));

                        loginProvider.isLoading = false;

                        Navigator.pushReplacementNamed(context, '/home');

                    }
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

