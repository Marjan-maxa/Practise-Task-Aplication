import 'package:flutter/material.dart';
import 'package:taskmanager_app_practise/ui/screens/add_task_screen.dart';

import '../../data/models/task_model.dart';
import '../../data/services/api_caller.dart';
import '../../data/urls/end_points.dart';
import '../widgets/snack_bar.dart';
import '../widgets/task_card.dart';
import '../widgets/tm_app_bar.dart';
class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<ProgressTaskScreen> {
  bool _getTaskProgress=false;
  List<TaskModel> _progressTaskList=[];
  Future<void>getAllProgressTask() async {
    _getTaskProgress=true  ;
    setState(() {

    });
    final ApiResponse response=await ApiCaller.getRequest(Urls.progressTaskByStatusUrl);
    _getTaskProgress=false;
    setState(() {

    });
    List<TaskModel> list=[];
    if(response.isSuccess){
      for(Map<String,dynamic>jsonData in response.responseData['data'])
        list.add(TaskModel.formJson(jsonData));
    }else{
      showSnakBarMassage(context, response.errorMessagge.toString());
    }
    _progressTaskList=list;


  }
@override
  void initState() {
    getAllProgressTask();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: TM_AppBar(),
      body: Column(
        children: [

          Expanded(
            child: Visibility(
              visible: _getTaskProgress==false,
              replacement: Center(child: CircularProgressIndicator()),
              child: ListView.separated(

                    itemCount: _progressTaskList.length,
                      itemBuilder: (context,index){
                        return Task_Card(
              multipleColor: Colors.purpleAccent,
              taskModel: _progressTaskList[index],
              refreshParent: () {
                getAllProgressTask();
              },);
                      }, separatorBuilder: (context,index){
                      return SizedBox(width: 0,);
                    }, ),
            ),  ),

        ],
      ),

    );
  }
}






