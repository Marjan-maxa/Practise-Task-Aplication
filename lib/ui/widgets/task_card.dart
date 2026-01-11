import 'package:flutter/material.dart';

class Task_Card extends StatelessWidget {
  const Task_Card({
    super.key, required this.status, required this.multipleColor,
  });

  final String status;
  final Color multipleColor;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 0),
        color: Colors.white,
        child: ListTile(
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(

          ),
          title: Text('This is task',style: Theme.of(context).textTheme.titleLarge,),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Description task'),
              Text('10/01/26'),
              Row(
                children: [
                  Chip(label: Text(status,style: TextStyle(fontSize: 12,height: 1),textScaler: const TextScaler.linear(1.0),),
                    backgroundColor: multipleColor,
                    labelStyle: TextStyle(color: Colors.white),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(15)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  Spacer(),
                  IconButton(onPressed: (){}, icon: Icon(Icons.edit_note_outlined,color: Colors.teal,)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,)),
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}