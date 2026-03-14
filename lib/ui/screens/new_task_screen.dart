import 'package:flutter/material.dart';
import 'package:taskmanager_app_practise/data/models/task_model.dart';
import 'package:taskmanager_app_practise/data/services/api_caller.dart';
import 'package:taskmanager_app_practise/ui/screens/add_task_screen.dart';
import 'package:taskmanager_app_practise/ui/widgets/snack_bar.dart';

import '../../data/models/task_status-count_model.dart';
import '../../data/urls/end_points.dart';
import '../widgets/task_card.dart';
import '../widgets/task_count.dart';
import '../widgets/tm_app_bar.dart';
class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool _getTaskStatusCountProgress=false;
  bool _getNewTaskProgress=false;
  List<TaskStatusCountModel> _taskStatusCountList=[];
  List<TaskModel> _newTaskList=[];
  Future<void>getAllTaskCount() async {
    _getTaskStatusCountProgress=true  ;
    setState(() {

    });
    final ApiResponse response=await ApiCaller.getRequest(Urls.TaskStatusCountUrl);
    _getTaskStatusCountProgress=false;
    setState(() {

    });
    List<TaskStatusCountModel> list=[];
    if(response.isSuccess){
   for(Map<String,dynamic>jsonData in response.responseData['data'])
     list.add(TaskStatusCountModel.formJson(jsonData));
    }else{
      showSnakBarMassage(context, response.errorMessagge.toString());
    }
    _taskStatusCountList=list;
    setState(() {

    });

  }

  Future<void>getAllTask() async {
    _getNewTaskProgress=true  ;
    setState(() {

    });
    final ApiResponse response=await ApiCaller.getRequest(Urls.listTaskByStatusUrl);
    _getNewTaskProgress=false;
    setState(() {

    });
    List<TaskModel> list=[];
    if(response.isSuccess){
      for(Map<String,dynamic>jsonData in response.responseData['data'])
        list.add(TaskModel.formJson(jsonData));
    }else{
      showSnakBarMassage(context, response.errorMessagge.toString());
    }
    _newTaskList=list;


  }
  @override
  void initState() {
    // TODO: implement initState
    getAllTaskCount();
    getAllTask();
    super.initState();
  }
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

             child: Visibility(
               visible: _getTaskStatusCountProgress==false,
               replacement: Center(child: CircularProgressIndicator()),
               child: ListView.separated(
                 scrollDirection: Axis.horizontal,
                 itemCount: _taskStatusCountList.length,
                   itemBuilder: (context,index){
                 return TaskountByStatus(
                   count: _taskStatusCountList[index].count,
                   title: _taskStatusCountList[index].status,
                 );
               },
                 separatorBuilder: (context,index){
                   return SizedBox(width: 0,);
                 },

               ),
             ),
           ),
         ),
         Expanded(
           child: Visibility(
             visible: _getNewTaskProgress==false,
             replacement: Center(child: CircularProgressIndicator()),
             child: ListView.separated(

                     itemCount: _newTaskList.length,
                 itemBuilder: (context,index){
               return Task_Card(
                 multipleColor: Colors.blue,
                 taskModel: _newTaskList[index],
                 refreshParent: () {
                   getAllTask();
                   getAllTaskCount();
                 },);
             }, separatorBuilder: (context,index){
               return SizedBox(width: 0,);
             },
             ),
           ),
         )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(50)
        ),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTaskScreen()));
        },child: Icon(Icons.add),),
    );
  }
}


// 51:00 minute after





