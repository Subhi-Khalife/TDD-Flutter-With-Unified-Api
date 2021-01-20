import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_tdd/core/error/failures.dart';
import 'package:http/http.dart' as http;
import 'package:test_tdd/core/unified_api/init_api_and_proccess.dart';

class GetApi extends InitApiAndProcess {
  GetApi(
      {@required String url,
      @required Map<String, dynamic> param,
      @required String token,
      @required String requestName})
      : super(param: param, requestName: requestName, token: token, url: url);

  String getParam() {
    String requestParam = "?";
    var keyList = param.keys.toList();
    var valuesList = param.values.toList();

    for (int i = 0; i < keyList.length; i++) {
      requestParam = requestParam + keyList[i] + "=" + valuesList[i].toString + "&";
    }
    requestParam = requestParam.substring(0, requestParam.length - 1);
    print("Param is : $requestParam");
    return requestParam;
  }


  @override
  Future<Either<Failure, String>> callRequest() async {
    String passParam = getParam();
    try {
      var response = await http
          .get(baseURL + url + passParam, headers: header)
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
