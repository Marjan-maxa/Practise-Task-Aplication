import 'package:flutter/material.dart';
import 'package:taskmanager_app_practise/ui/widgets/screen_bacround.dart';
import 'package:taskmanager_app_practise/ui/widgets/tm_app_bar.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TM_AppBar(),
      body: ScreenBacround(child:
      Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 90,),
            Text('Add New Task',style: Theme.of(context).textTheme.titleLarge,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Subject'
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              maxLines: 8,
              decoration: InputDecoration(
                  hintText: 'Description'
              ),
            ),
            const SizedBox(height: 20,),
            FilledButton(onPressed: (){}, child: Icon(Icons.arrow_circle_right_outlined,size: 25,))
          ],
        ),
      ),
      ),
    );
  }
}
