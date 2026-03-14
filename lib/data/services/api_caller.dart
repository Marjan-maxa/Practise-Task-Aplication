import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart';
import 'package:taskmanager_app_practise/ui/screens/controller/auth_controller.dart';

import '../../app.dart';
import '../../ui/screens/login_screen.dart';
class ApiCaller{

  // 1:08 minutes starting
 static final Logger _logger=Logger();
 static Future<ApiResponse> getRequest(String url) async {
    try{
      Uri uri=Uri.parse(url);
      _logRequest(url);
      Response response=await get(uri,headers: {
        'token':AuthController.accessToken??'',

      });
      _logResponse(url,response);
      final int statusCode=response.statusCode;
      final decodedData=jsonDecode(response.body);
      if(statusCode==200){

       return ApiResponse(
           responseCode: statusCode,
           isSuccess: true,
           responseData: decodedData);
      }else if(statusCode==401){
        moveToLogin();
        return ApiResponse(
            responseCode: -1,
            isSuccess: false,
            responseData: null);
      }
      else{
        return ApiResponse(
            responseCode: statusCode,
            isSuccess: false,
            responseData: decodedData);
      }
    }catch(e){
      return ApiResponse(
          responseCode: -1,
          isSuccess: false,
          responseData: null,
        errorMessagge: e.toString()
      );

    }
  }

 static Future<ApiResponse> postRequest({required Map<String, dynamic> body, required String url, }) async {
    try{
      Uri uri=Uri.parse(url);
      _logRequest(url,body: body);
      Response response=await post(uri,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "token":AuthController.accessToken??''
        },
        body: body!=null? jsonEncode(body): null,
      );
      _logResponse(url, response);
      final int statusCode=response.statusCode;
      final decodedData=jsonDecode(response.body);
      if(statusCode==200){

        return ApiResponse(
            responseCode: statusCode,
            isSuccess: true,
            responseData: decodedData);
      }else if(statusCode==401){
        moveToLogin();
        return ApiResponse(
            responseCode: -1,
            isSuccess: false,
            responseData: null);
      }
      else{
        return ApiResponse(
            responseCode: statusCode,
            isSuccess: false,
            responseData: decodedData);
      }
    }catch(e){
      return ApiResponse(
          responseCode: -1,
          isSuccess: false,
          responseData: null,
          errorMessagge: e.toString()
      );

    }
  }

  static void _logRequest(String Url,{Map<String,dynamic>? body}){
        _logger.i(
            'Url=>$Url'

                'Request Body=> ${body}'
        );
  }

  static void _logResponse(String Url,Response response){
   _logger.i(
     'Status Code=> ${response.statusCode}'
         'Response Body => ${response.body}'
   );

  }
  static Future<void>moveToLogin()async {
   AuthController.clearUserData();
   Navigator.pushReplacement(TaskManagerApp.navigator.currentContext!, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

}

class ApiResponse{
  final int responseCode;
  final dynamic responseData;
  final bool isSuccess;
  final String? errorMessagge;

  ApiResponse(
      {required this.responseCode,
    required this.responseData,
    required this.isSuccess,
    this.errorMessagge='Something Error..',
      }
      );
}