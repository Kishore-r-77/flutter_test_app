import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_test_app/screens/home_page.dart';
import 'package:go_test_app/utils/authUtils/auth_utils.dart';
import 'package:go_test_app/utils/networkUtils/network_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthNotifier extends StateNotifier<dynamic> {
  AuthNotifier() : super({});
  final dio = Dio();
  String authToken = "";
  dynamic mobile = "";
  String name = "";
  String email = "";
  dynamic companyId = "";
  dynamic languageId = "";

  SharedPreferences? sharedPreferences;
  final Future<SharedPreferences> prefsMain = SharedPreferences.getInstance();

  dynamic signin(phone, password, context, prefs, scaffoldMessengerKey) async {
    final response = await dio.post(
      "http://localhost:3000/api/v1/auth/login",
      data: {'phone': phone, 'password': password, 'channel': 'app'},
    );

    try {
      state = response.data; // Set the response data as the state

      // Access the message property from the response data
      final message = response.data['message'];

      authToken = message['authToken'];
      sharedPreferences = await prefsMain;
      sharedPreferences?.setString('authToken', message['authToken']);
      sharedPreferences?.setInt('companyId', message['companyId']);

      AuthUtils.insertDetails(prefs, message);

      mobile = message['phone'];
      name = message['name'];
      email = message['email'];
      companyId = message['companyId'];
      languageId = message['languageId'];

      if (response.statusCode == 200) {
        Navigator.of(context).pushNamed(HomePage.routeName, arguments: prefs);
      } else {
        NetworkUtils.showSnackBar(
            scaffoldMessengerKey, "error loging in: $response");
      }
      return state;
    } catch (err) {
      NetworkUtils.showSnackBar(
          scaffoldMessengerKey, "error loging in: in catch block");
      print(err);
      return err;
    }
  }
}

final authProvider =
    StateNotifierProvider<AuthNotifier, dynamic>((ref) => AuthNotifier());
