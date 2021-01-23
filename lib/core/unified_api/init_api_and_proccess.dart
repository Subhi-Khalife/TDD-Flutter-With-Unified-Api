import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:test_tdd/core/unified_api/api_proccess.dart';

abstract class InitApiAndProcess extends ApiProcess {
  String url;
  final  String baseURL = 'http://scholarlive.404developers.com/';
  String token;
  String requestName;
  Map<String , String> header ;

  InitApiAndProcess(
      {this.token,
        @required this.url,
        this.requestName})
      : super(requestName: requestName) {
        header = {
      HttpHeaders.authorizationHeader: "Bearer $token",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json"
    };
  }

  Future<String> callRequest();
}
