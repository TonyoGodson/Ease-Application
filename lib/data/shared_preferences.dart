

import 'dart:convert';

import 'package:ease_app/core/utils/constants.dart';
import 'package:ease_app/model/user_login_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model_view/auth_view_model.dart';

class SharedPrefService{

  Future<void> writeCache(String key, UserLoginResponse value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    String jsonString = jsonEncode(value);

    bool isSaved = await pref.setString(key, jsonString);
  }

  Future<String?> readCache(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    String? value = pref.getString(key);
    if(value != null){
      return value;
    }
    return null;
  }


  Future<void> clearCache() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    bool isCleared = await pref.clear();
  }

  Future<void> writeRememberMe(BuildContext context, String key, bool value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bool rem = await pref.setBool(key, value);
    context.read<AuthViewModel>().rememberMe = value;
    print('rem $rem');
    print('remb ${context.read<AuthViewModel>().rememberMe}');
    readRememberMe(Constants.REMEMBER_ME);
  }

  Future<bool?> readRememberMe(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bool? getrem = await pref.getBool(key);
    print('getrem $getrem');
    if(getrem != null){
      return getrem;
    }
    return null;
  }

}