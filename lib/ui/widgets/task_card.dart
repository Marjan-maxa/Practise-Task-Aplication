import 'package:flutter/material.dart';
import 'package:taskmanager_app_practise/data/models/task_model.dart';
import 'package:taskmanager_app_practise/ui/widgets/snack_bar.dart';

import '../../data/services/api_caller.dart';
import '../../data/urls/end_points.dart';

class Task_Card extends StatefulWidget {
  const Task_Card({
    super.key, required this.taskModel, required this.multipleColor,  required this.refreshParent,
  });

  final TaskModel taskModel;
  final Color multipleColor;
  final VoidCallback refreshParent;

  @override
  State<Task_Card> createState() => _Task_CardState();
}

class _Task_CardState extends State<Task_Card> {


  @override
  Widget build(BuildContext context) {

    bool _changeStatusProgress=false;
    Future<void>changeTaskStatus(String status) async {
      _changeStatusProgress=true  ;
      setState(() {

      });
      final ApiResponse response=await ApiCaller.getRequest(Urls.changeStatusUrl(widget.taskModel.id, status));
      _changeStatusProgress=false;
      setState(() {

      });

      if(response.isSuccess){
       widget.refreshParent();
       Navigator.pop(context);

      }else{
        showSnakBarMassage(context, response.errorMessagge.toString());
      }

    }

    bool _deletetaskLoading=false;
    Future<void>deleteAllTask() async {
      _deletetaskLoading=true ;
      setState(() {

      });
      ApiResponse response=await ApiCaller.getRequest(Urls.deleteTaskByStatusUrl(widget.taskModel.id));
      _deletetaskLoading=false;
      setState(() {

      });
      if(response.isSuccess){
        widget.refreshParent();
        showSnakBarMassage(context, 'Task Successfully Deleted!');
      }else {
        showSnakBarMassage(context, response.errorMessagge!);
      }

    }

   void _showChangeStatusDialoge(){
     showDialog(context: context, builder: (context){
       return AlertDialog(
         title:Text('Change Status'),
         content: Column(
           mainAxisSize: MainAxisSize.min,
           children: [
             ListTile(
               onTap: (){
                 changeTaskStatus('New');
               },
               title: Text('New'),
               trailing: widget.taskModel.status=='New'?Icon(Icons.done):null,
             ),
             ListTile(
               onTap: (){
                 changeTaskStatus('Progress');
               },
               title: Text('Progress'),
               trailing: widget.taskModel.status=='Progress'?Icon(Icons.done):null,
             ),
             ListTile(
               onTap: (){
                 changeTaskStatus('Completed');
               },
               title: Text('Completed'),
               trailing: widget.taskModel.status=='Completed'?Icon(Icons.done):null,
             ),
             ListTile(
               onTap: (){
                 changeTaskStatus('Cancelled');
               },
               title: Text('Cancelled'),
               trailing: widget.taskModel.status=='Cancelled'?Icon(Icons.done):null,
             )
           ],
         ),
       );
     });
    }
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 0),
        color: Colors.white,
        child: ListTile(
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(

          ),
          title: Text(widget.taskModel.title,style: Theme.of(context).textTheme.titleLarge,),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.taskModel.description),
              Text(widget.taskModel.createdDate),
              Row(
                children: [
                  Chip(label: Text(widget.taskModel.status,style: TextStyle(fontSize: 12,height: 1),textScaler: const TextScaler.linear(1.0),),
                    backgroundColor: widget.multipleColor,
                    labelStyle: TextStyle(color: Colors.white),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(15)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  Spacer(),
                  IconButton(onPressed: (){
                    _showChangeStatusDialoge();
                  }, icon: Icon(Icons.edit_note_outlined,color: Colors.teal,)),
                  IconButton(onPressed: (){
                    deleteAllTask();

                  }, icon: Icon(Icons.delete,color: Colors.red,)),
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}