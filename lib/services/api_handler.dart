import 'dart:convert';

import 'package:ease_app/core/utils/color_utils.dart';
import 'package:ease_app/core/utils/helper.dart';
import 'package:ease_app/data/network/app_urls.dart';
import 'package:ease_app/model/reset_password_response.dart';
import 'package:ease_app/model/user_sign_up_response.dart';
import 'package:ease_app/shared/reusable_dialogs.dart';
import 'package:ease_app/view/authentication/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../model/user_login_response.dart';
import '../model_view/auth_view_model.dart';

class ApiHandler{
  static Future<bool> loginToApp(BuildContext context, Map<String, dynamic> loginRequest) async {
    showLoadingDialog(context, "Logging in");
    try {
      var uri = Uri.https(AppUrls.BASE_URL, AppUrls.LOGIN_URL);
      var response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(loginRequest),
      );
      if(response.statusCode == 201) {
        context.read<AuthViewModel>().loginResponse = UserLoginResponse.fromJson(jsonDecode(response.body));
        Navigator.of(context, rootNavigator: true).pop();
        return true;
      } else if(response.statusCode == 400) {
        Navigator.of(context, rootNavigator: true).pop();
        var responseJson = jsonDecode(response.body);
        showSnackbar(context, "${responseJson["message"]}", ColorUtils.RED_COLOR2);
        return false;
      }else if(response.statusCode == 404) {
        Navigator.of(context, rootNavigator: true).pop();
        var responseJson = jsonDecode(response.body);
        showSnackbar(context, "${responseJson["message"]}", ColorUtils.RED_COLOR2);
        return false;
      }else if(response.statusCode == 500) {
        Navigator.of(context, rootNavigator: true).pop();
        var responseJson = jsonDecode(response.body);
        showSnackbar(context, "${responseJson["message"]}", ColorUtils.RED_COLOR2);
        return false;
      }
    } catch (e) {
      Navigator.of(context, rootNavigator: true).pop();
      print('caught error ${e.toString()}');
    }
    return false;
  }

  static Future<bool> signUpToApp(BuildContext context, Map<String, dynamic> signUpRequest) async {
    showLoadingDialog(context, "Creating Account");
    try {
      var uri = Uri.https(AppUrls.BASE_URL, AppUrls.SIGNUP_URL);
      var response = await http.post(uri,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(signUpRequest));
      debugPrint('response ${jsonDecode(response.body)}');
      if(response.statusCode == 200) {
        context.read<AuthViewModel>().signUpResponse = UserSignUpResponse.fromJson(jsonDecode(response.body));
        Navigator.of(context, rootNavigator: true).pop();
        var responseJson = jsonDecode(response.body);
        showSnackbar(
            context,
            "${responseJson["message"]}",
            ColorUtils.GREEN_COLOR2,
          showAction: true,
          action: (){
              Navigator.of(context).pushNamed(LoginScreen.routeName);
          }
        );
        return true;
      } else if(response.statusCode == 400) {
        Navigator.of(context, rootNavigator: true).pop();
        debugPrint('response ${jsonDecode(response.body)}');
        var responseJson = jsonDecode(response.body);
        showSnackbar(context, "${responseJson}", ColorUtils.RED_COLOR2);
        return false;
      }else {
        Navigator.of(context, rootNavigator: true).pop();
        debugPrint('response ${jsonDecode(response.body)}');
        var responseJson = jsonDecode(response.body);
        showSnackbar(context, "${responseJson["message"]}", ColorUtils.RED_COLOR2);
        return false;
      }
    } catch (e) {
      Navigator.of(context, rootNavigator: true).pop();
      print('caught error ${e.toString()}');
    }
    return false;
  }

  static Future<bool> forgotPassword(BuildContext context, Map<String, dynamic> forgotPasswordRequest) async {
    showLoadingDialog(context, "Loading");
    try {
      var uri = Uri.https(AppUrls.BASE_URL, AppUrls.FORGOT_PASSWORD_URL);
      var response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(forgotPasswordRequest),
      );
      debugPrint('response ${jsonDecode(response.body)}');
      if(response.statusCode == 200) {
        Navigator.of(context, rootNavigator: true).pop();
        var responseJson = jsonDecode(response.body);
        showSnackbar(context, "${responseJson['message']}", ColorUtils.GREEN_COLOR2);
        return true;
      } else if(response.statusCode == 400) {
        debugPrint('response ${jsonDecode(response.body)}');
        Navigator.of(context, rootNavigator: true).pop();
        var responseJson = jsonDecode(response.body);
        showSnackbar(context, "${responseJson['message']}", ColorUtils.RED_COLOR2);
        return false;
      }else if(response.statusCode == 500) {
        debugPrint('response ${jsonDecode(response.body)}');
        Navigator.of(context, rootNavigator: true).pop();
        var responseJson = jsonDecode(response.body);
        showSnackbar(context, "${responseJson['message']}", ColorUtils.RED_COLOR2);
        return false;
      }
    } catch (e) {
      Navigator.of(context, rootNavigator: true).pop();
      print('caught error ${e.toString()}');
    }
    return false;
  }

  static Future<bool> resetPassword(BuildContext context, Map<String, dynamic> resetRequest) async {
    showLoadingDialog(context, "Loading");
    try {
      var uri = Uri.https(AppUrls.BASE_URL, AppUrls.RESET_PASSWORD_URL);
      var response = await http.put(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(resetRequest),
      );
      debugPrint('response ${jsonDecode(response.body)}');
      if(response.statusCode == 200) {
        context.read<AuthViewModel>().resetPasswordResponse = ResetPasswordResponse.fromJson(jsonDecode(response.body));
        showSnackbar(
            context,
            "${context.read<AuthViewModel>().resetPasswordResponse?.message}",
            ColorUtils.GREEN_COLOR2);
        Navigator.of(context, rootNavigator: true).pop();
        return true;
      } else if(response.statusCode == 400) {
        debugPrint('response ${jsonDecode(response.body)}');
        Navigator.of(context, rootNavigator: true).pop();
        var responseJson = jsonDecode(response.body);
        showSnackbar(context, "${responseJson['message']}", ColorUtils.RED_COLOR2);
        return false;
      }else if(response.statusCode == 500) {
        debugPrint('response ${jsonDecode(response.body)}');
        Navigator.of(context, rootNavigator: true).pop();
        var responseJson = jsonDecode(response.body);
        showSnackbar(context, "${responseJson['message']}", ColorUtils.RED_COLOR2);
        return false;
      }
    } catch (e) {
      Navigator.of(context, rootNavigator: true).pop();
      print('caught error ${e.toString()}');
    }
    return false;
  }
}

dynamic returnResponse(http.Response response){
  switch (response.statusCode){
    case 200:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;

    case 201:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;

    case 400:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;

    case 500:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;

    default:
      throw
      "Error while communicating with the server using status code ${response.statusCode}";
  }
}