import 'package:grand_bazar/Util/ApiUtils/RequestBody/changePassword.dart';
import 'package:grand_bazar/Util/ApiUtils/RequestBody/userLoginRequest.dart';
import 'package:grand_bazar/Util/ApiUtils/Responses/postRequestResponse.dart';
import 'package:grand_bazar/Util/ApiUtils/sessionManager/userSession.dart';
import 'package:grand_bazar/Util/constants/apiurlConstants.dart';
import 'dart:convert';

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

import '../Responses/loginResponse.dart';
import '../model/UserModel.dart';

class UserService {
  static Future<int> registerUser(User user) async {
    var client = http.Client();
    final url = Uri.parse(baseUrl + signUp_url);

    print(json.encode(user.toJson()));
    try {
      var response = await client.post(url,
          headers: {
            "content-type": "application/json",
          },
          body: json.encode(user.toJson()));
      print(response.statusCode);
      return response.statusCode;
    } on Exception catch (_, ex) {
      return 01;
    }
  }

  static Future<ResponseBuilder> loginUser(
      UserLoginRequest loginRequest) async {
    var client = http.Client();
    UserSession? userSession;
    final url = Uri.parse(baseUrl + login_url);

    print(json.encode(loginRequest.toJson()));
    try {
      var response = await client.post(url,
          headers: {
            "content-type": "application/json",
          },
          body: json.encode(loginRequest.toJson()));
      print(response.statusCode);
      if (response.statusCode == 202) {
        userSession = UserSession.fromJson(jsonDecode(response.body));

        return ResponseBuilder(
            statusCode: response.statusCode, userSession: userSession);
      } else {
        return ResponseBuilder.m(01);
      }
    } on Exception catch (_, ex) {
      print(ex);
      return ResponseBuilder.m(01);
    }
  }

  static Future<int> changePasswordUser(
      UserPasswordChangeRequest request, String clientID) async {
    var client = http.Client();
    final url = Uri.parse(baseUrl + changepassword + clientID);
    print(url);

    print(json.encode(request.toJson()));
    try {
      var response = await client.post(url,
          headers: {
            "content-type": "application/json",
          },
          body: json.encode(request.toJson()));
      print(response.statusCode);
      return response.statusCode;
    } on Exception catch (_, ex) {
      return 01;
    }
  }
}
