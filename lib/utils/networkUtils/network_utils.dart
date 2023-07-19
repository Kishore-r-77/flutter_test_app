import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_test_app/utils/authUtils/auth_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class NetworkUtils {
  static const String developmentHost = 'localhost:3000';
  static const String host = developmentHost;
  // static final String host = developmentHost;
  //static final String productionHost =
  //  'https://futurainstech-mobile.herokuapp.com';

  static dynamic validateUser(SharedPreferences? sharedPreferences) async {
    var uri = Uri.http(host, 'api/v1/auth/validateUser');
    String? authToken = AuthUtils.getAuthToken(sharedPreferences!);
    final response =
        await http.get(uri, headers: {"Cookie": "Authorization=$authToken"});

    if (response.statusCode == 401) {
      final resp = await doRefresh(sharedPreferences);
      return resp;
    }

    return response;
  }

  static showSnackBar(
      GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey, String message) {
    scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
      content: Text(message ?? 'You are offline'),
    ));
  }

  static dynamic doRefresh(SharedPreferences sharedPreferences) async {
    String? refreshToken = AuthUtils.getRefreshToken(sharedPreferences);
    var uri = Uri.http(host, 'api/v1/auth/refresh');
    final response =
        await http.get(uri, headers: {"Cookie": "RefreshToken=$refreshToken"});
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      AuthUtils.insertAuthToken(sharedPreferences, responseJson["authToken"]);
    }
    return response;
  }

  static dynamic onLogin(
      SharedPreferences? sharedPreferences, String text, String text2) async {
    var body = jsonEncode({'phone': text, 'password': text2, 'channel': 'app'});

    var uri = Uri.http('localhost:3000', 'api/v1/auth/login');

    try {
      final response = await http.post(uri,
          headers: {"Content-Type": "application/json"}, body: body);

      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        responseJson['valid'] = true;
        AuthUtils.insertDetails(sharedPreferences!, responseJson["message"]);
        return responseJson;
      } else {
        var responseJson = json.decode(response.body);
        responseJson['valid'] = false;
        return responseJson;
      }
    } catch (exception) {
      var responseJson = {"valid": false, "body": exception.toString()};
      return responseJson;
    }
  }
}
