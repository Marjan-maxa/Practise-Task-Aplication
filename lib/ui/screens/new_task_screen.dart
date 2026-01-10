import 'package:flutter/material.dart';

import '../widgets/task_card.dart';
import '../widgets/task_count.dart';
import '../widgets/tm_app_bar.dart';
class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: TM_AppBar(),
      body: Column(
        children: [
         Padding(
           padding: const EdgeInsets.all(2.0),
           child: SizedBox(
             height: 100,

             child: ListView.separated(
               scrollDirection: Axis.horizontal,
               itemCount: 4,
                 itemBuilder: (context,index){
               return TaskountByStatus(count: index+5, title: 'Cancelled',);
             },
               separatorBuilder: (context,index){
                 return SizedBox(width: 2,);
               },

             ),
           ),
         ),
         Expanded(
           child: ListView.separated(itemBuilder: (context,index){
             return Task_Card();
           }, separatorBuilder: (context,index){
             return SizedBox(width: 2,);
           }, itemCount: 10),
         )
        ],
      ),
    );
  }
}






