import 'package:flutter/material.dart';
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
  final ImagePicker picker = ImagePicker();
  XFile ? _selectedImage;
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
      body: ScreenBacround(child:
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 70,),
            Text('Update Profile',style:Theme.of(context).textTheme.titleLarge,),
            const SizedBox(height: 15,),
            photo_Picker(onTap: imgPick,selectedPhoto: _selectedImage,),
            const SizedBox(height: 20,),
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
          ],
        ),
      ),
      ),
    );
  }
}


