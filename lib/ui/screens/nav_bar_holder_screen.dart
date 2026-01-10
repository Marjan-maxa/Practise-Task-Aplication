import 'package:flutter/material.dart';
import 'package:taskmanager_app_practise/ui/screens/new_task_screen.dart';
import 'package:taskmanager_app_practise/ui/screens/progress_task_screen.dart';

class NavBarHolderScreen extends StatefulWidget {
  const NavBarHolderScreen({super.key});

  @override
  State<NavBarHolderScreen> createState() => _NavBarHolderScreenState();
}

class _NavBarHolderScreenState extends State<NavBarHolderScreen> {

  int _selectedIndex=0;
  List<Widget> screens=[
    NewTaskScreen(),
    ProgressTaskScreen(),
    ProgressTaskScreen(),
    ProgressTaskScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
          onDestinationSelected: (int index){
          _selectedIndex=index;
          setState(() {

          });
          },

          destinations: [
        NavigationDestination(icon: Icon(Icons.task), label: 'New Task'),
        NavigationDestination(icon: Icon(Icons.refresh), label: 'Progress'),
        NavigationDestination(icon: Icon(Icons.done_all), label: 'Completed'),
        NavigationDestination(icon: Icon(Icons.close), label: 'Cancelled'),
      ]),
    );
  }
}
