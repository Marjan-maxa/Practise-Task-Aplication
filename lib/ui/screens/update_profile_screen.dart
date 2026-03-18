import 'package:flutter/material.dart';
import 'package:taskmanager_app_practise/data/models/user_model.dart';
import 'package:taskmanager_app_practise/ui/screens/controller/auth_controller.dart';
import 'package:taskmanager_app_practise/ui/widgets/screen_bacround.dart';
import 'package:taskmanager_app_practise/ui/widgets/tm_app_bar.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/photo_picker.dart';


class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

TextEditingController emailController=TextEditingController();
TextEditingController firstNameController=TextEditingController();
TextEditingController lastNameController=TextEditingController();
TextEditingController mobileController=TextEditingController();
final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();
  XFile ? _selectedImage;
  @override
  void initState() {

    UserModel user=AuthController.userModel!;
    emailController.text=user.email;
    firstNameController.text=user.firstName;
    lastNameController.text=user.lastName;
    mobileController.text=user.mobile;
    // TODO: implement initState
    super.initState();
  }

  Future<void> imgPick() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _selectedImage = image;
      setState(() {

      });
      print('Selected Image Path: ${image.path}');
    } else {
      print('User cancelled picking image');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TM_AppBar(),
      body: SingleChildScrollView(
        child: ScreenBacround(child:
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70,),
                Text('Update Profile',style:Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 15,),
                photo_Picker(onTap: imgPick,selectedPhoto: _selectedImage,),
                const SizedBox(height: 20,),
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
                          if(_formkey.currentState!.validate()){

                          }
                        }, child: Icon(Icons.arrow_circle_right_outlined,size: 25,))
                ),
              ],
            ),
          ),
        ),
        ),
      ),
    );
  }
}
 // 21 module class 1 ,  48:55 start  again

