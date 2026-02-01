import 'package:flutter/material.dart';
import 'package:taskmanager_app_practise/ui/screens/login_screen.dart';
import 'package:taskmanager_app_practise/ui/screens/update_profile_screen.dart';
class TM_AppBar extends StatelessWidget implements PreferredSizeWidget{
  const TM_AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.teal,
      title: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfileScreen()));
        },
        child: Row(
          children: [
            CircleAvatar(),
            const SizedBox(width: 8,),
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
      ),
      actions: [
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

        }, icon: Icon(Icons.logout,color: Colors.white,))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}