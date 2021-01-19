import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';
import 'dart:convert';

enum ApiType { Get, Post, Update, Delete ,Put}

class Api {
  ApiType apiType;
  String url, baseURL = 'http://scholarlive.404developers.com/';
  Map<String, dynamic> param;
  dynamic token;
  Map<String, String> header;
  String requestName;
  Api(
      {@required this.url,
        @required this.param,
        @required this.apiType,
        @required this.token ,
        @required this.requestName}) {
    header = {
     HttpHeaders.authorizationHeader: "Bearer $token",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json"
    };
  }
  String getParam() {
    String requestParam = "?";
    var keyList = param.keys.toList();
    var valuesList = param.values.toList();

    for (int i = 0; i < keyList.length; i++) {
      requestParam = requestParam + keyList[i] + "=" + valuesList[i] + "&";
    }
    requestParam = requestParam.substring(0, requestParam.length - 1);
    print(requestParam);
    return requestParam;
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
/// item1 status item2 body
  Future<Tuple2<int , String>> makeGetConnection() async {
    String passParam = getParam();
    try {
      var response = await http
          .get(baseURL + url + passParam, headers: header)
          .timeout(Duration(seconds: 30));
      printStatusCode(response.statusCode);
      print("the response body $requestName is :: ${response.body} ");
      // if (response.statusCode == 220)
      //   return response.body;
      // else
        return Tuple2(response.statusCode , response.body);
    } on TimeoutException catch (e) {
      print("TimeoutException Into $requestName");
      return  Tuple2( 0 , e.toString());
    } catch (e) {
      print("Error Happened Into $requestName");
      print("the error is :: $e");
     // showMessage('No Internet connection',true);
      return  Tuple2( 1 , e.toString());
    }
  }

  Future<Tuple2<int , String>> makeAddUpdateDelete() async {
    print("the test makeAddUpdateDelete param $param header $header  ");

    try {
      var response = await http
          .post(baseURL + url, headers: header, body: jsonEncode(param))
          .timeout(Duration(seconds: 30));
      printStatusCode(response.statusCode);
      print("the response body into  $requestName is :: ${response.body} ");
      // if (apiType == ApiType.Post && response.statusCode == 220)
      //   return Tuple2(response.statusCode , response.body);
      // if (apiType == ApiType.Update && response.statusCode == 235)
      //   return Tuple2(response.statusCode , response.body);
      // if (apiType == ApiType.Delete && response.statusCode == 240)
      //   return Tuple2(response.statusCode , response.body);
      // else
        return Tuple2(response.statusCode , response.body);
    } on TimeoutException catch (e) {
      print("TimeoutException Into $requestName");
      return Tuple2( 0 , e.toString());
    } catch (e) {
      print("Error Happened Into $requestName");
      print("the error is :: $e");
      return Tuple2( 1 , e.toString());
    }
  }

  Future<Tuple2<int , String>> makePutConnection() async {
    print("the test makeAddUpdateDelete ");
    try {
      var response = await http
          .put(baseURL + url, headers: header, body: param)
          .timeout(Duration(seconds: 30));
      printStatusCode(response.statusCode);
      print("the response body into  $requestName is :: ${response.body} ");
      // if (apiType == ApiType.Post && response.statusCode == 220)
      //   return Tuple2(response.statusCode , response.body);
      // if (apiType == ApiType.Update && response.statusCode == 235)
      //   return Tuple2(response.statusCode , response.body);
      // if (apiType == ApiType.Delete && response.statusCode == 240)
      //   return Tuple2(response.statusCode , response.body);
      // else
      return Tuple2(response.statusCode , response.body);
    } on TimeoutException catch (e) {
      print("TimeoutException Into $requestName");
      return Tuple2( 0 , e.toString());
    } catch (e) {
      print("Error Happened Into $requestName");
      print("the error is :: $e");
      return Tuple2( 1 , e.toString());
    }
  }
}
