import 'package:flutter/material.dart';
import 'package:taskmanager_app_practise/data/services/api_caller.dart';
import 'package:taskmanager_app_practise/ui/widgets/screen_bacround.dart';

import '../../data/urls/end_points.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController mobileController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();



// after start 31:55 minutes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ScreenBacround(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100,),
                    Text('Join With Us',style:Theme.of(context).textTheme.titleLarge,),
                    const SizedBox(height: 15,),
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
                    const SizedBox(height: 20,),
                    TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                          hintText: 'First Name'
                      ),
                      validator: (String? value){
                        if(value==null || value.isEmpty)
                        {
                          return 'Please enter your first name';
                        }
                        if(value.trim().length<2)
                        {
                          return 'First name must be at least 2 character';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                          hintText: 'Last Name'
                      ),
                      validator: (String? value){
                        if(value==null || value.isEmpty)
                        {
                          return 'Please enter your last name';
                        }
                        if(value.trim().length<2)
                        {
                          return 'First name must be at least 2 character';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      controller: mobileController,
                      decoration: InputDecoration(
                          hintText: 'Mobile'
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your mobile number';
                        }

                        final bdPhoneRegExp = RegExp(r'^(013|014|015|016|017|018|019)\d{8}$');

                        if (!bdPhoneRegExp.hasMatch(value.trim())) {
                          return 'Enter a valid Bangladesh mobile number';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 20,),
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
                        height: 50,
                        width: double.infinity,
                        child: Visibility(
                          visible: !signUpInProgress,
                          replacement: Center(child: CircularProgressIndicator()),
                          child: FilledButton(

                              style: FilledButton.styleFrom(
                                  backgroundColor: Colors.teal
                              ),
                              onPressed: (){
                                if(_formkey.currentState!.validate()){
                                  signUp();

                                }
                              }, child: Icon(Icons.arrow_circle_right_outlined,size: 25,)),
                        )
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
              ),
            )),
      ),
    );

  }
  bool signUpInProgress=false;
  Future<void>signUp() async {

    clearTextFeild(){
      emailController.clear();
      firstNameController.clear();
      lastNameController.clear();
      mobileController.clear();
      passwordController.clear();
    }

  setState(() {
    signUpInProgress = true;
  });

    Map<String,dynamic> requestBody={
      "email":emailController.text,
      "firstName":firstNameController.text,
      "lastName":lastNameController.text,
      "mobile":mobileController.text,
      "password":passwordController.text
    };

    final ApiResponse response=await ApiCaller.postRequest(
        url:Urls.registrationUrl,
        body: requestBody
    );
    setState(() {
      signUpInProgress=false;
    });

    if(response.isSuccess){
      clearTextFeild();
      Navigator.pushNamed(context, 'LogInScreen');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
      Text('Registration successfully Completed..!',),
        backgroundColor: Colors.teal,
        duration: Duration(seconds: 3),
      ),

      );
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
    firstNameController.dispose();
    lastNameController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

