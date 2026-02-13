import 'dart:convert';

import '../../../data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthController{
  static String  _accessTokenKey='token';
  static String  userKeyModel="user-data";

  static String? accessToken;
  static UserModel? userModel;
static Future  saveUserData(UserModel model,String token) async {
   SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
  await sharedPreferences.setString(_accessTokenKey, token);
  await sharedPreferences.setString(userKeyModel, jsonEncode(model.toJson()));
   accessToken=token;
   userModel=model;
  }

  static Future getUserData() async {
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  String? token= sharedPreferences.getString(_accessTokenKey);
  if(token!=null){
    String? userData=sharedPreferences.getString(userKeyModel);
    userModel=UserModel.fromJson(jsonDecode(userData!));
  }
  }

  static Future<bool> isUserLoggedIn() async {
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  String? token=sharedPreferences.getString(_accessTokenKey);
  return token!=null;
  }
}