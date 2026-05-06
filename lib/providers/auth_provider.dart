import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmanager_app_practise/core/enums/api_state.dart';
import 'package:taskmanager_app_practise/data/models/user_model.dart';
import 'package:provider/provider.dart';
class AuthProvider extends ChangeNotifier{
  static const String _accessTokenKey = 'access_token';
  static const String _userKeyModel = 'user_model';

  String ? _accessToken;
  String ? _errorMessage;
  UserModel? _userModel;
  ApiState _authState =ApiState.initial;
  String? get accessToken=>_accessToken;
  String? get errorMessage=>_errorMessage;
  UserModel? get userModel=>_userModel;
  ApiState get authState=>_authState;
  bool get isLoggedIn => _accessToken != null && _accessToken!.isNotEmpty;
   Future  saveUserData(UserModel model,String token) async {
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey, token);
    await sharedPreferences.setString(_userKeyModel, jsonEncode(model.toJson()));
    _accessToken = token;
    _userModel = model;
    notifyListeners();
  }
  Future loadUserData() async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    String? token= sharedPreferences.getString(_accessTokenKey);
    if(token!=null){
      _accessToken=token;
      String? userData=sharedPreferences.getString(_userKeyModel);
      _userModel=UserModel.fromJson(jsonDecode(userData!));
    }
    notifyListeners();
  }

   Future<void> updateUserData(UserModel model) async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    await sharedPreferences.setString(_userKeyModel, jsonEncode(model.toJson()));
    _userModel = model;
    notifyListeners();
  }

  static Future<bool> isUserLoggedIn() async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    String? token=sharedPreferences.getString(_accessTokenKey);
    return token!=null;
  }
  Future<void> logout() async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    _accessToken = null;
    _userModel = null;
    _authState = ApiState.initial;
    notifyListeners();
  }

  void setLoading(){
     _authState=ApiState.loading;
     notifyListeners();
  }
  void setSuccess(){
    _authState=ApiState.success;
    notifyListeners();
  }
  void setError(){
    _authState=ApiState.error;
    _errorMessage = null;
    notifyListeners();
  }
  void setReset(){
    _authState=ApiState.initial;
    _errorMessage=null;
    notifyListeners();
  }
}