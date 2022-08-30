
import 'package:flutter/material.dart';
import 'package:products_app/providers/login_form_provider.dart';
import 'package:products_app/ui/input_decoration.dart';
import 'package:products_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/register_form_provider.dart';
import '../services/services.dart';

class RegisterScreen extends StatelessWidget{



  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final registerProvider = Provider.of<RegisterFormProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: LoginBackgroundWidget(
        child: SingleChildScrollView(child: _LoginForm(context:context, registerProvider: registerProvider)),
      ),
    );
  }

  Column _LoginForm({required BuildContext context, required RegisterFormProvider registerProvider}) {
    return Column(
        children: [
          SizedBox(height: 200),
          CardContainerWidget(
              child: _LoginFields(context: context, registerProvider: registerProvider),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: Text('All ready have an account?', style: TextStyle(color: Colors.indigo,fontSize: 18, fontWeight: FontWeight.w600)),
          )
        ],
      );
  }

  Column _LoginFields({required BuildContext context, required RegisterFormProvider registerProvider}) {
    
    return Column(

      children: [
        SizedBox( height: 10,),
        Text('Register', style: Theme.of(context).textTheme.headline4,),
        SizedBox( height: 30,),


        Container(
          child: Form(
            key: registerProvider.formKey,
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
                    registerProvider.setEmail(value);
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
                    registerProvider.setPassword(value);
                  },
                ),
                SizedBox(height: 30,),
                MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  color: Colors.deepPurple,
                    elevation: 10,
                    child: Container(
                      child: Center(child: Text(registerProvider.isLoading? 'Wait': 'Register', style: TextStyle(color: Colors.grey),)),
                      height: 60,
                      width: 60,
                    ),

                    onPressed: registerProvider.isLoading ? null : ()async{
                      FocusScope.of(context).unfocus();

                      if(registerProvider.isValidForm() == true){

                        registerProvider.isLoading = true;

                        //await Future.delayed(Duration(seconds: 2)); //for testing purposes
                        final authService = Provider.of<AuthService>(context, listen: false);
                        final String? response = await authService.createUser(registerProvider.email, registerProvider.password);

                        if(response == null){
                          registerProvider.isLoading = false;
                          Navigator.pushReplacementNamed(context, '/home');
                        }else{
                          print(response);
                        }

                        registerProvider.isLoading = false;


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

