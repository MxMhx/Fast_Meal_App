import 'dart:convert';

import 'package:fastmeal/config.dart';
import 'package:fastmeal/models/login_request_model.dart';
import 'package:fastmeal/models/login_response_model.dart';
import 'package:fastmeal/models/register_request_model.dart';
import 'package:fastmeal/models/register_respone_model.dart';
import 'package:fastmeal/services/shared_service.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequest model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.loginAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      //SHARED
      await SharedService.setLoginDetails(loginRequestFromJson(response.body));
      return true;
    } else {
      return false;
    }
  }

  static Future<RegisterResponse?> register(RegisterRequest model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.registerAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return registerResponseFromJson(response.body);
  }
}
