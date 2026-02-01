import 'package:flutter/material.dart';
import 'package:taskmanager_app_practise/ui/widgets/screen_bacround.dart';

import 'forget_password_otp_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ScreenBacround(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100,),
                  Text('Join With Us',style:Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 15,),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Email'
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'First Name'
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Last Name'
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Mobile'
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Password'
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: FilledButton(
              
                          style: FilledButton.styleFrom(
                              backgroundColor: Colors.teal
                          ),
                          onPressed: (){
                          }, child: Icon(Icons.arrow_circle_right_outlined,size: 25,))
                  ),
                  const SizedBox(height: 20,),
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 20,),
              
                        RichText(
                          text:TextSpan(
                              text: "Have account?",
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                              children: [
              
                                TextSpan(
                                    text: " Sing In",
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
            )),
      ),
    );
  }
}
