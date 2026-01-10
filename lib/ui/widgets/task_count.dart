import 'package:flutter/material.dart';

class TaskountByStatus extends StatelessWidget {
  final int count;
  final String title;
  const TaskountByStatus({
    super.key, required this.count, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1,vertical: 10),
      child: SizedBox(
        height: 100,
        width: 100,
        child: Card(
          color: Colors.white,
          elevation: 5,
          child: Column(
            children: [
              Text(count.toString(),style: Theme.of(context).textTheme.titleLarge,),
              Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}