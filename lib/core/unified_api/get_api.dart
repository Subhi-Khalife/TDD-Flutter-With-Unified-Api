import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_tdd/core/error/failures.dart';
import 'package:http/http.dart' as http;
import 'package:test_tdd/core/unified_api/init_api_and_proccess.dart';

import '../error/exception.dart';

class GetApi extends InitApiAndProcess {

  Map<String, dynamic> param;

  GetApi(
      {@required String url,
      @required String token,
       this.param,
       String requestName})
      : super( requestName: requestName, token: token, url: url);

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
  Future<String> callRequest() async {
    String passParam = getParam();
    try {
      print("The << param >> request $requestName -> $param");

      print("Getting.......");

      final http.Response response = await http
          .get(baseURL + url + passParam, headers: header)
          .timeout(Duration(seconds: 30));

      printResponse(response);


      if (response.statusCode == 220)
        return response.body;
      else {
        Exception exception = getException(statusCode: response.statusCode);

        throw (exception);
      }

    } on TimeoutException catch (e) {

      print("TimeoutException Into $requestName");
      throw(TimeoutException(e.message));

    } catch (exception) {
      print("the catch error  is : $exception");
      throw (exception);
    }
  }
}
