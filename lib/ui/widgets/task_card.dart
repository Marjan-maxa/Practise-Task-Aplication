import 'package:flutter/material.dart';

class Task_Card extends StatelessWidget {
  const Task_Card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        child: ListTile(
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(

          ),
          title: Text('This is task'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Description task'),
              Text('10/01/26'),
              Row(
                children: [
                  Chip(label: Text('New'),
                    backgroundColor: Colors.blue,
                    labelStyle: TextStyle(color: Colors.white),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(15)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 19),
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