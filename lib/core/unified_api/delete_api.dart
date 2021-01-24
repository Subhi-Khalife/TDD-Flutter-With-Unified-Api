import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:test_tdd/core/unified_api/initial_api.dart';
import 'package:http/http.dart' as http;

class DeleteApi extends InitialApi {
  Map<String, dynamic> param;
  DeleteApi(
      {@required String url,
      @required this.param,
       String token,
       String requestName})
      : super(requestName: requestName, token: token, url: url);

  @override
  Future<String> callRequest() async {

    try {
      print("The << param >> request $requestName -> $param");

      print("Deleting.......");
      final http.Response response = await http
          .post(baseURL + url, headers: header, body: jsonEncode(param))
          .timeout(Duration(seconds: 30));

      printResponse(response);

      if (response.statusCode == 250)
        return response.body;
      else {
        Exception exception = getException(statusCode: response.statusCode);

        throw (exception);
      }

    }catch (exception) {
      print("the catch error  is : $exception");
      throw (exception);
    }
  }
}
