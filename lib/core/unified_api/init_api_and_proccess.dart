import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_tdd/core/error/exception.dart';
import 'package:test_tdd/core/error/failures.dart';
import 'package:test_tdd/core/unified_api/api_proccess.dart';

abstract class InitApiAndProcess extends ApiProccess {
  String url, baseURL = 'http://scholarlive.404developers.com/';
  Map<String, dynamic> param;
  dynamic token;
  String requestName;
  Map<String , dynamic> header ;

  InitApiAndProcess(
      {
      this.token,
      @required this.url,
      @required this.param,
      @required this.requestName})
      : super(requestName: requestName) {
        header = {
      HttpHeaders.authorizationHeader: "Bearer $token",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json"
    };
  }

  Future<Either<Failure, String>> callRequest();
}
