import 'package:flutter/material.dart';
import 'package:taskmanager_app_practise/ui/screens/add_task_screen.dart';

import '../../data/models/task_model.dart';
import '../../data/services/api_caller.dart';
import '../../data/urls/end_points.dart';
import '../widgets/snack_bar.dart';
import '../widgets/task_card.dart';
import '../widgets/task_count.dart';
import '../widgets/tm_app_bar.dart';
class CancelledTaskScreeen extends StatefulWidget {
  const CancelledTaskScreeen({super.key});

  @override
  State<CancelledTaskScreeen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<CancelledTaskScreeen> {
  bool _getCancelledTaskProgress=false;
  List<TaskModel> _cancelledTaskList=[];
  Future<void>getAllCancelledTask() async {
    _getCancelledTaskProgress=true  ;
    setState(() {

    });
    final ApiResponse response=await ApiCaller.getRequest(Urls.cancelledTaskByStatusUrl);
    _getCancelledTaskProgress=false;
    setState(() {

    });
    List<TaskModel> list=[];
    if(response.isSuccess){
      for(Map<String,dynamic>jsonData in response.responseData['data'])
        list.add(TaskModel.formJson(jsonData));
    }else{
      showSnakBarMassage(context, response.errorMessagge.toString());
    }
    _cancelledTaskList=list;


  }
  @override
  void initState() {
    getAllCancelledTask();
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
              visible: _getCancelledTaskProgress==false,
              replacement: Center(child: CircularProgressIndicator()),
              child: ListView.separated(

                    itemCount: _cancelledTaskList.length,
                      itemBuilder: (context,index){
                        return Task_Card(
              multipleColor: Colors.red,
              taskModel: _cancelledTaskList[index],
              refreshParent: () {

                getAllCancelledTask();
              },);
                      }, separatorBuilder: (context,index){
                      return SizedBox(width: 0,);
                    }, ),
            ),
          )
        ],


      ),

    );
  }
}






