import 'package:flutter/material.dart';
import 'package:taskmanager_app_practise/ui/screens/add_task_screen.dart';

import '../widgets/task_card.dart';
import '../widgets/task_count.dart';
import '../widgets/tm_app_bar.dart';
class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<CompletedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: TM_AppBar(),
      body: Column(
        children: [

          Expanded(
            child: ListView.separated(itemBuilder: (context,index){
              return Task_Card(status: 'Completed', multipleColor: Colors.green,);
            }, separatorBuilder: (context,index){
              return SizedBox(width: 2,);
            }, itemCount: 10),
          )
        ],
      ),

    );
  }
}






