import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:http/http.dart';
class ApiCaller{

  // 1:08 minutes starting
 static final Logger _logger=Logger();
 static Future<ApiResponse> getRequest(String url) async {
    try{
      Uri uri=Uri.parse(url);
      _logRequest(url);
      Response response=await get(uri);
      _logResponse(url,response);
      final int statusCode=response.statusCode;
      final decodedData=jsonDecode(response.body);
      if(statusCode==200){

       return ApiResponse(
           responseCode: statusCode,
           isSuccess: true,
           responseData: decodedData);
      }else{
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
      }else{
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