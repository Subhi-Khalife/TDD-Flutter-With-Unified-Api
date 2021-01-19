// import 'dart:async';
// import 'package:dartz/dartz.dart';
// import 'package:test_tdd/core/error/failures.dart';
// import 'package:test_tdd/core/unified_api/init_api.dart';
// import 'package:http/http.dart'as http;

// class GetApi<T> extends InitApiAndProccess{


//   String getParam() {
//     String requestParam = "?";
//     var keyList = param.keys.toList();
//     var valuesList = param.values.toList();

//     for (int i = 0; i < keyList.length; i++) {
//       requestParam = requestParam + keyList[i] + "=" + valuesList[i] + "&";
//     }
//     requestParam = requestParam.substring(0, requestParam.length - 1);
//     print(requestParam);
//     return requestParam;
//   }


//   Future<Either<T,Failure>> makeGetConnection() async {
//     String passParam = getParam();
//     try {
//       var response = await http
//           .get(baseURL + url + passParam, headers: header)
//           .timeout(Duration(seconds: 30));
//       printStatusCode(response.statusCode);
//       print("the response body $requestName is :: ${response.body} ");
//       // if (response.statusCode == 220)
//       //   return response.body;
//       // else
//         return Tuple2(response.statusCode , response.body);
//     } on TimeoutException catch (e) {
//       print("TimeoutException Into $requestName");
//       return  Tuple2( 0 , e.toString());
//     } catch (e) {
//       print("Error Happened Into $requestName");
//       print("the error is :: $e");
//      // showMessage('No Internet connection',true);
//       return  Tuple2( 1 , e.toString());
//     }
//   }
// }