import 'package:flutter/material.dart';
import 'package:taskmanager_app_practise/providers/auth_provider.dart';
import 'package:taskmanager_app_practise/providers/network_provider.dart';
import 'app.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_)=>NetworkProvider()),
      ],
      child: TaskManagerApp(),
    ),
  );
}

