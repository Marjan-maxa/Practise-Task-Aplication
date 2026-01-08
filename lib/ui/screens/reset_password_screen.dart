import 'package:flutter/material.dart';
import 'package:taskmanager_app_practise/ui/widgets/screen_bacround.dart';

import 'forget_password_otp_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBacround(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 160,),
                  Text('Set Password',style:Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 10,),
                  Text('Minimum length password 7 character with Latter and number combination',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color:Colors.grey )),
                  const SizedBox(height: 15,),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Password'
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Confirm Password'
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
                          }, child: Text('Confirm'))
                  ),
                  const SizedBox(height: 20,),
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 20,),

                        RichText(
                          text:TextSpan(
                              text: "Already have an account?",
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
            ),
          )),
    );
  }
}
