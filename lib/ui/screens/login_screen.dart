import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager_app_practise/ui/screens/forget_password_email_verify.dart';
import 'package:taskmanager_app_practise/ui/screens/signup_screen.dart';
import 'package:taskmanager_app_practise/ui/widgets/screen_bacround.dart';

import 'nav_bar_holder_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    void _onTabSinup(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
    }

    void _onTabForgetPassword(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordEmailVerify()));
    }

    return Scaffold(
      body:
      ScreenBacround(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 160,),
                Text('Get Started With',style:Theme.of(context).textTheme.titleLarge,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email'
                  ),
                ),
                const SizedBox(height: 12,),
             TextFormField(
               decoration: InputDecoration(
                 hintText: 'Password'
               ),
             ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                    child: FilledButton(
            
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.teal
                      ),
                        onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NavBarHolderScreen()));
                        }, child: Icon(Icons.arrow_circle_right_outlined,size: 25,))
                ),
                const SizedBox(height: 20,),
            
               Center(
                 child: Column(
                   children: [
                     const SizedBox(height: 20,),
                   TextButton(onPressed: _onTabForgetPassword, child: Text('Forget Password?',style: TextStyle(color: Colors.black38),)),
                     RichText(
                       text:TextSpan(
                           text: "Don't have Account?",
                           style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                           children: [
            
                             TextSpan(
                                 text: " Sing Up",
                                 recognizer: TapGestureRecognizer()..onTap=_onTabSinup,
                                 style: TextStyle(color: Colors.teal)
                             )
                           ]
            
                       ),
            
                     ),
                   ],
                 ),
               )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
