import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager_app_practise/data/models/user_model.dart';
import 'package:taskmanager_app_practise/ui/screens/controller/auth_controller.dart';
import 'package:taskmanager_app_practise/ui/screens/forget_password_email_verify.dart';
import 'package:taskmanager_app_practise/ui/screens/signup_screen.dart';
import 'package:taskmanager_app_practise/ui/widgets/screen_bacround.dart';

import '../../data/services/api_caller.dart';
import '../../data/urls/end_points.dart';
import 'nav_bar_holder_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
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
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 160,),
                  Text('Get Started With',style:Theme.of(context).textTheme.titleLarge,),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email'
                    ),
                    validator: (String ? value){
                      if(value==null || value.isEmpty){
                        return 'Please enter your email';
                      }
                      final emailRegExp = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|net|org|edu|bd)$',
                      );


                      if(!emailRegExp.hasMatch(value)){
                        return 'Please Enter valid Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12,),
               TextFormField(
                 controller: passwordController,
                 decoration: InputDecoration(
                   hintText: 'Password'
                 ),
                 validator: (String? value) {
                   if (value == null || value.isEmpty) {
                     return 'Please enter your password';
                   }

                   if (value.length < 8) {
                     return 'Password must be at least 8 characters';
                   }

                   if (!RegExp(r'[A-Z]').hasMatch(value)) {
                     return 'Password must contain at least one uppercase letter';
                   }

                   if (!RegExp(r'[a-z]').hasMatch(value)) {
                     return 'Password must contain at least one lowercase letter';
                   }

                   if (!RegExp(r'[0-9]').hasMatch(value)) {
                     return 'Password must contain at least one number';
                   }

                   if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                     return 'Password must contain at least one special character';
                   }

                   return null; // valid password
                 },
               ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    width: double.infinity,
                      child: FilledButton(

                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.teal
                        ),
                          onPressed: (){
                          if(_formkey.currentState!.validate()){
                            _signIn();
                          }
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
      ),
    );
  }
  bool signUpInProgress=false;
  Future<void>_signIn() async {

    clearTextFeild(){
      emailController.clear();
      passwordController.clear();
    }

    setState(() {
      signUpInProgress = true;
    });

    Map<String,dynamic> requestBody={
      "email":emailController.text,
      "password":passwordController.text
    };

    final ApiResponse response=await ApiCaller.postRequest(
        url:Urls.loginUrl,
        body: requestBody
    );
    setState(() {
      signUpInProgress=false;
    });

    if(response.isSuccess){
      UserModel model=UserModel.fromJson(response.responseData['data']);
      String accesstoken=response.responseData['token'];
     await AuthController.saveUserData(model, accesstoken);
      clearTextFeild();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
      Text('login successfully Completed..!',),
        backgroundColor: Colors.teal,
        duration: Duration(seconds: 3),
      ),

      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NavBarHolderScreen()));
    }else{

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
      Text(response.responseData['data']),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      )
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
