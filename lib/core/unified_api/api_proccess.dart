import 'package:test_tdd/core/error/failures.dart';

class ApiProccess{
  String _requestName;
  ApiProccess({requestName});

  void printStatusCode(int statusCode) {
    print("The status code into $_requestName -> $statusCode");
    if (statusCode == 220) print("Success Get Request into $_requestName ");
    if (statusCode == 230) print("Success Insert Request into $_requestName");
    if (statusCode == 235) print("Success Update Request into $_requestName");
    if (statusCode == 240) print("Success Delete Request into $_requestName");
    if (statusCode == 330)
      print("Data Duplicates Already Exists into $_requestName");
    if (statusCode == 400) print("Missing Param into $_requestName");
    if (statusCode == 460 || statusCode == 550)
      print("user not allowed to access this data into $_requestName");
    if (statusCode == 560) print("operation failed into $_requestName");
    if (statusCode == 499) print("token mismatch into $_requestName");
    if (statusCode == 401) print("Data not Found into $_requestName");
    if (statusCode == 522) print("Invalid Email Address into $_requestName");
    if (statusCode == 477) print("Invalid Phone into $_requestName");
  }

  Failure getFailerStatus(int statusCode) {
    if (statusCode == 330) {
      return DataDuplicatesFailure();
    } else if (statusCode == 400) {
      return MissingParamFailure();
    } else if (statusCode == 460 || statusCode == 550) {
      return UserNotAllowedToAccessFailure();
    } else if (statusCode == 560) {
      return OperationFailedFailure();
    } else if (statusCode == 499) {
      return TokenMisMatchFailure();
    } else if (statusCode == 401) {
      return DataNotFoundFailure();
    } else if (statusCode == 522) {
      return InvalidEmailFailure();
    } else if (statusCode == 477) {
      return InvalidPhoneFailure();
    } else {
      return ServerFailure();
    }
  }



}