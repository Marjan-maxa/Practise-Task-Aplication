import 'package:flutter/material.dart';
import 'package:taskmanager_app_practise/data/services/api_caller.dart';
import 'package:taskmanager_app_practise/ui/widgets/screen_bacround.dart';
import 'package:taskmanager_app_practise/ui/widgets/tm_app_bar.dart';

import '../../data/urls/end_points.dart';
import '../widgets/snack_bar.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController _subjectController=TextEditingController();
  TextEditingController _descriptionController=TextEditingController();
  final GlobalKey<FormState>_formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TM_AppBar(),
      body: ScreenBacround(child:
      Padding(
        padding: const EdgeInsets.all(17.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 90,),
                Text('Add New Task',style: Theme.of(context).textTheme.titleLarge,),
                TextFormField(
                  controller: _subjectController,
                  decoration: InputDecoration(
                    hintText: 'Subject',
                  ),
                  validator: (String? value){
                    if(value==null || value.isEmpty)
                    {
                      return 'Please Enter title';
                    }
                    if(value.trim().length<2)
                    {
                      return 'First word must be at least 2 character';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 8,
                  decoration: InputDecoration(
                      hintText: 'Description'
                  ),
                  validator: (String? value){
                    if(value==null || value.isEmpty)
                    {
                      return 'Please enter your Description';
                    }
                    if(value.trim().length<2)
                    {
                      return 'First name must be at least 2 character';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20,),
                FilledButton(onPressed: (){
                  if(_formKey.currentState!.validate()){
                    addnewTask();
                  }
                }, child: Icon(Icons.arrow_circle_right_outlined,size: 25,))
              ],
            ),
          ),
        ),
      ),
      ),
    );
   }
   bool _addTaskProgress=false;
  Future<void>addnewTask()async {
    _addTaskProgress=true;
    setState(() {
      
    });
    Map<String,dynamic>responseBody={
      "title":_subjectController.text,
      "description": _descriptionController.text,
      "status":"New"
    };
   final ApiResponse response=await ApiCaller.postRequest(
      url: Urls.createTaskUrl,
      body: responseBody,
    );
   _addTaskProgress=false;
   setState(() {

   });
   if(response.isSuccess){
     _clearFeild();
     showSnakBarMassage(context,'Task Added Successfully');
   }else{
     showSnakBarMassage(context,response.errorMessagge!);
   }



  }


  _clearFeild(){
    _subjectController.clear();
    _descriptionController.clear();
  }
}
