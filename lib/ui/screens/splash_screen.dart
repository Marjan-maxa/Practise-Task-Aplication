import 'package:flutter/material.dart';
import 'package:taskmanager_app_practise/ui/screens/login_screen.dart';
import 'package:taskmanager_app_practise/ui/utils/assets_path.dart';
import 'package:taskmanager_app_practise/ui/widgets/screen_bacround.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> _moveToNextScreen()async {
   await Future.delayed(Duration(seconds: 3));
   final authProvider=Provider.of<AuthProvider>(context,listen: false);
   authProvider.loadUserData();
   if(authProvider.isLoggedIn){
     Navigator.pushReplacementNamed(context, 'navBar');
   }else {
     Navigator.pushReplacement(
         context, MaterialPageRoute(builder: (context) => LoginScreen()));
   }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBacround(child: Center(child: Image.asset(AssetsPath.logoImgPath,scale: 3,)))

    );
  }
}

