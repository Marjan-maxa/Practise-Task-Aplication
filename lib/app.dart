import 'package:flutter/material.dart';
import 'package:taskmanager_app_practise/ui/screens/splash_screen.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: Colors.teal,
            fixedSize: Size.fromWidth(double.maxFinite),
            padding: EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            )
          )
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          )
        ),
        colorSchemeSeed: Colors.teal,
          inputDecorationTheme:InputDecorationTheme(
              fillColor: Colors.white,
              filled: true  ,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none
              ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none
            ),

          )
      ),
      debugShowCheckedModeBanner: false,
         home: SplashScreen(),
    );
  }
}
