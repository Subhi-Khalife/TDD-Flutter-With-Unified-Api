import 'dart:io';

import 'package:flutter/cupertino.dart';

class InitApiAndProcess {
  String url, baseURL = 'http://scholarlive.404developers.com/';
  Map<String, dynamic> param;
  dynamic token;
  Map<String, String> header;
  String requestName;

  InitApiAndProcess(
      {@required this.url,
      @required this.param,
      @required this.token,
      @required this.requestName}) {
    header = {
      HttpHeaders.authorizationHeader: "Bearer $token",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json"
    };
  }
    void printStatusCode(int statusCode) {
    print("The status code into $requestName -> $statusCode");
    if (statusCode == 220) print("Success Get Request into $requestName ");
    if (statusCode == 230) print("Success Insert Request into $requestName");
    if (statusCode == 235) print("Success Update Request into $requestName");
    if (statusCode == 240) print("Success Delete Request into $requestName");
    if (statusCode == 330)
      print("Data Duplicates Already Exists into $requestName");
    if (statusCode == 400) print("Missing Param into $requestName");
    if (statusCode == 460 || statusCode == 550)
      print("user not allowed to access this data into $requestName");
    if (statusCode == 560) print("operation failed into $requestName");
    if (statusCode == 499) print("token mismatch into $requestName");
    if (statusCode == 401) print("Data not Found into $requestName");
    if (statusCode == 522) print("Invalid Email Address into $requestName");
    if (statusCode == 477) print("Invalid Phone into $requestName");
  }
}
