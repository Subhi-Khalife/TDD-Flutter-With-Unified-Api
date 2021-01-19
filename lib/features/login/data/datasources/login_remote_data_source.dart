import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:test_tdd/core/error/exception.dart';
import 'package:test_tdd/core/error/failures.dart';
import 'package:test_tdd/features/login/data/models/login_model.dart';
import 'package:test_tdd/features/login/domain/entities/login.dart';
import 'package:http/http.dart' as http;

class LoginRemoteDataSource {
  static Future<LoginModel> loginEmailRemote(
      {String email, String password}) async {
    String url = "http://ScholarLive.404Developers.com/client/auth/login";

    final param = {"phone": email, "password": password};

    try {
      var responce = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.acceptHeader: "application/json"
        },
        body: jsonEncode(param),
      );

      print("response body :: ${responce.body}  ${responce.statusCode}");
      
      if (responce.statusCode == 220) {
        return loginModelFromJson(responce.body);
      } else {
        throw TestException();
      }
    } catch (r) {
      throw ServerException();
    }
  }
}
