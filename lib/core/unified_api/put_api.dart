import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:test_tdd/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:test_tdd/core/unified_api/init_api_and_proccess.dart';
import 'package:http/http.dart' as http;

class PutApi extends InitApiAndProcess {
  PutApi(
      {@required String url,
      @required Map<String, dynamic> param,
      @required String token,
      @required String requestName})
      : super(param: param, requestName: requestName, token: token, url: url);

  @override
  Future<Either<Failure, String>> callRequest() async {
    print("the test makeAddUpdateDelete param $param header $header  ");

    try {
      var response = await http
          .post(baseURL + url, headers: header, body: jsonEncode(param))
          .timeout(Duration(seconds: 30));
      printStatusCode(response.statusCode);
      if (response.statusCode == 220)
        return Right(response.body);
      else {
        Failure failure = getFailerStatus(response.statusCode);
        return Left(failure);
      }
    } on TimeoutException catch (e) {
      print("TimeoutException Into $requestName");
      return Left(TimeOutFailure());
    } catch (e) {
      print("Error Happened Into $requestName");
      print("the error is :: $e");
      return Left(ServerFailure());
    }
  }
}
