import 'package:flutter/material.dart';
import 'package:taskmanager_app_practise/ui/widgets/screen_bacround.dart';

class ForgetPasswordEmailVerify extends StatelessWidget {
  const ForgetPasswordEmailVerify({super.key});

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
                  Text('Your Email Address',style:Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 10,),
                  Text('A 6 digit verification pin will send to your email address',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color:Colors.grey )),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Email'
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                      width: double.infinity,
                      child: FilledButton(
              
                          style: FilledButton.styleFrom(
                              backgroundColor: Colors.teal
                          ),
                          onPressed: (){}, child: Icon(Icons.arrow_circle_right_outlined,size: 25,))
                   ),
                  const SizedBox(height: 20,),
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 20,),
              
                        RichText(
                          text:TextSpan(
                              text: "Have Account?",
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
