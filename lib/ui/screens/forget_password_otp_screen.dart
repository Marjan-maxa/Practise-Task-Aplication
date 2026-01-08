import 'package:flutter/material.dart';
import 'package:taskmanager_app_practise/ui/screens/reset_password_screen.dart';
import 'package:taskmanager_app_practise/ui/widgets/screen_bacround.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class ForgetPasswordOtpScreen extends StatelessWidget {
  const ForgetPasswordOtpScreen({super.key});

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
                  Text('Pin Verification',style:Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 10,),
                  Text('A 6 digit verification pin will send to your email address',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color:Colors.grey )),
                  const SizedBox(height: 15,),
                  PinCodeTextField(
                    keyboardType: TextInputType.number,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeColor: Colors.teal,
                      activeFillColor: Colors.white,
                      inactiveColor: Colors.grey  ,
                      selectedColor: Colors.green,

                    ),
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,

                   appContext: context,


                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPasswordScreen()));
                          }, child: Text('Confirm'))
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
