import 'package:flutter/cupertino.dart';
import 'package:taskmanager_app_practise/core/enums/api_state.dart';
import 'package:taskmanager_app_practise/data/models/user_model.dart';

import '../data/services/api_caller.dart';
import '../data/urls/end_points.dart';

class NetworkProvider extends ChangeNotifier {
  ApiState _loginState = ApiState.initial;
  ApiState _registrationState = ApiState.initial;
  ApiState _profileUpdateState = ApiState.initial;
  String? _errorMessage;

  ApiState get loginState => _loginState;
  ApiState get registrationState => _registrationState;
  ApiState get profileUpdateState => _profileUpdateState;
  String? get errorMessage => _errorMessage;

  Future<Map<String, dynamic>?> login({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> requestBody = {"email": email, "password": password};
    final ApiResponse response = await ApiCaller.postRequest(
      url: Urls.loginUrl,
      body: requestBody,
    );
    if (response.isSuccess) {
      _loginState = ApiState.success;
      notifyListeners();
      return {
        'user': UserModel.fromJson(response.responseData['data']),
        'token': response.responseData['token'],
      };
    } else {
      _loginState = ApiState.error;
      _errorMessage = response.errorMessagge ?? 'Login Failed!';
      notifyListeners();
      return null;
    }
  }

  Future<Map<String, dynamic>?> registration({
    required String email,
    required String firstName,
    required String lastName,
    required String mobile,
    required String password,
  }) async {
    Map<String, dynamic> requestBody = {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "password": password,
    };
    final ApiResponse response = await ApiCaller.postRequest(
      url: Urls.registrationUrl,
      body: requestBody,
    );
    if (response.isSuccess) {
      _registrationState = ApiState.success;
      notifyListeners();
      return response.responseData;
    } else {
      _registrationState = ApiState.error;
      _errorMessage = response.errorMessagge ?? 'Registration Failed!';
      notifyListeners();
      return null;
    }
  }
}
