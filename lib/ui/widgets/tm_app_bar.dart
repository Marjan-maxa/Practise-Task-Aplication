import 'package:flutter/material.dart';
class TM_AppBar extends StatelessWidget implements PreferredSizeWidget{
  const TM_AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.teal,
      title: Row(
        children: [
          CircleAvatar(),
          const SizedBox(width: 5,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Md. Marjan',style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.white
              ),),
              Text('abx12@gmai.com',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white
              ),),
            ],
          ),

        ],
      ),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.logout,color: Colors.white,))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}