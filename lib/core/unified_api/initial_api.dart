import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:test_tdd/core/unified_api/handling_exception.dart';
import 'package:test_tdd/core/unified_api/printing.dart';

abstract class InitialApi extends Printing with HandlingExceptionRequest {
  String url;
  final  String baseURL = 'http://scholarlive.404developers.com/';
  String token;
  Map<String , String> header ;

  InitialApi(
      {this.token,
        @required this.url,
        String requestName}) :super (requestName:requestName ) {
        header = {
      HttpHeaders.authorizationHeader: "Bearer $token",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json"
    };
  }

  Future<String> callRequest();
}

