import 'dart:convert';

import 'package:ease_app/core/utils/color_utils.dart';
import 'package:ease_app/core/utils/constants.dart';
import 'package:ease_app/core/utils/helper.dart';
import 'package:ease_app/model/user_login_response.dart';
import 'package:flutter/cupertino.dart';

import '../data/shared_preferences.dart';
import '../model/reset_password_response.dart';
import '../model/user_sign_up_response.dart';

class AuthViewModel extends ChangeNotifier{

  SharedPrefService sharedPrefService = SharedPrefService();

  bool? _rememberMe;

  bool? get rememberMe => _rememberMe;

  set rememberMe(bool? value){
    _rememberMe = value;
    notifyListeners();
  }

  UserLoginResponse? _loginResponse;

  UserLoginResponse? get loginResponse => _loginResponse;

  set loginResponse(UserLoginResponse? response){
    _loginResponse = response;
    notifyListeners();
  }

  UserSignUpResponse? _signUpResponse;

  UserSignUpResponse? get signUpResponse => _signUpResponse;

  set signUpResponse(UserSignUpResponse? response){
    _signUpResponse = response;
    notifyListeners();
  }

  ResetPasswordResponse? _resetPasswordResponse;

  ResetPasswordResponse? get resetPasswordResponse => _resetPasswordResponse;

  set resetPasswordResponse(ResetPasswordResponse? response){
    _resetPasswordResponse = response;
    notifyListeners();
  }

  // String userName = "";

  Future<String?> profileName() async {
    String? userName;
    String? value = await sharedPrefService.readCache(Constants.LOGIN_KEY);

    if (value != null) {
      try {
        Map<String, dynamic> result = jsonDecode(value);
        userName = result['userInfo']['fullName']?.split(" ")[0];
      } catch (e) {
        print("Error decoding JSON: $e");
      }
    } else if (loginResponse?.userInfo?.fullName != null) {
      userName = loginResponse!.userInfo!.fullName!.split(" ")[0];
    } else {
      userName = "Null";
    }
    return userName;
  }

}