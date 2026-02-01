import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';
class ApiCaller {
  static final Logger _logger=Logger();
 static Future<ApiResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);
     _logRequest(url);
      Response response = await get(uri);
      _logResponse(url, response);
      final int statusCode = response.statusCode;
      final decodedData = jsonDecode(response.body);
      if (statusCode == 200) {
        return ApiResponse(
          responseCode: statusCode,
          responseData: decodedData,
          isSuccess: true,
        );
      } else {
        return ApiResponse(
          responseCode: statusCode,
          responseData: null,
          isSuccess: decodedData,
        );
      }
    } catch (e) {
      return ApiResponse(
        responseCode: -1,
        responseData: null,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

 static Future<ApiResponse> postRequest(
    String url,
    Map<String, dynamic>? body,
  ) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url);
      Response response = await post(
        uri,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body: body != null ? jsonEncode(body) : null,
      );
      _logResponse(url, response);
      final int statusCode = response.statusCode;
      final decodedData = jsonDecode(response.body);
      if (statusCode == 200 || statusCode==201) {
        return ApiResponse(
          responseCode: statusCode,
          responseData: decodedData,
          isSuccess: true,
        );
      } else {
        return ApiResponse(
          responseCode: statusCode,
          responseData: null,
          isSuccess: decodedData,
        );
      }
    } catch (e) {
      return ApiResponse(
        responseCode: -1,
        responseData: null,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  static void _logRequest(String Url, {Map<String, dynamic>? body}){
   _logger.i(
     'Url=> $Url'
     'RequestBody=> ${body}'
   );
  }

  static void _logResponse(String Url, Response response){
    _logger.i(
        'status Code=> ${response.statusCode}'
            'Response Body:  ${response.body}'
    );
  }

 }





class ApiResponse {
  final int responseCode;
  final dynamic responseData;
  final bool isSuccess;
  final String? errorMessage;

  ApiResponse({
    required this.responseCode,
    required this.responseData,
    required this.isSuccess,
    this.errorMessage='Something went wrong',
  });
}

