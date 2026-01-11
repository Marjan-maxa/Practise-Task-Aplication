import 'package:flutter/material.dart';
import 'package:taskmanager_app_practise/ui/screens/add_task_screen.dart';

import '../widgets/task_card.dart';
import '../widgets/task_count.dart';
import '../widgets/tm_app_bar.dart';
class CancelledTaskScreeen extends StatefulWidget {
  const CancelledTaskScreeen({super.key});

  @override
  State<CancelledTaskScreeen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<CancelledTaskScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: TM_AppBar(),
      body: Column(
        children: [

          Expanded(
            child: ListView.separated(itemBuilder: (context,index){
              return Task_Card(status: 'Cancelled', multipleColor: Colors.red,);
            }, separatorBuilder: (context,index){
              return SizedBox(width: 1,);
            }, itemCount: 10),
          )
        ],
      ),

    );
  }
}






