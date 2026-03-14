import 'package:flutter/material.dart';
import '../../data/models/task_model.dart';
import '../../data/services/api_caller.dart';
import '../../data/urls/end_points.dart';
import '../widgets/snack_bar.dart';
import '../widgets/task_card.dart';
import '../widgets/tm_app_bar.dart';
class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<CompletedTaskScreen> {
  bool _getCompletedTaskProgress=false;
  List<TaskModel> _completedTaskList=[];
  Future<void>getAllCompletedTask() async {
    _getCompletedTaskProgress=true  ;
    setState(() {

    });
    final ApiResponse response=await ApiCaller.getRequest(Urls.completedTaskByStatusUrl);
    _getCompletedTaskProgress=false;
    setState(() {

    });
    List<TaskModel> list=[];
    if(response.isSuccess){
      for(Map<String,dynamic>jsonData in response.responseData['data'])
        list.add(TaskModel.formJson(jsonData));
    }else{
      showSnakBarMassage(context, response.errorMessagge.toString());
    }
    _completedTaskList=list;


  }
  @override
  void initState() {
    getAllCompletedTask();
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
              visible: _getCompletedTaskProgress==false,
              replacement: Center(child: CircularProgressIndicator()),
              child: ListView.separated(

                itemCount: _completedTaskList.length,
                itemBuilder: (context,index){
                  return Task_Card(
                    multipleColor: Colors.green,
                    taskModel: _completedTaskList[index],
                    refreshParent: () {

                      getAllCompletedTask();
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






