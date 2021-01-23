import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:test_tdd/core/error/failures.dart';
import '../error/exception.dart';
import '../error/exception.dart';
import '../error/exception.dart';
import '../error/exception.dart';
import '../error/failures.dart';



typedef Future<String> _RequestCall();

class ApiProcess{
  String requestName;

  ApiProcess({this.requestName});

  void printResponse (Response response) {
    print("The << status code >> into $requestName -> ${response.statusCode}");
    if (response.statusCode == 220) print("Success << GET >>    Request into -> $requestName");
    if (response.statusCode == 230) print("Success << POST >>   Request into -> $requestName");
    if (response.statusCode == 240) print("Success << PUT >>    Request into -> $requestName");
    if (response.statusCode == 250) print("Success << DELETE >> Request into -> $requestName");
    if (response.statusCode == 330)
      print("Data Duplicates Already Exists into $requestName");
    if (response.statusCode == 400) print("Missing Param into $requestName");
    if (response.statusCode == 460 || response.statusCode == 550)
      print("user not allowed to access this data into $requestName");
    if (response.statusCode == 560) print("operation failed into $requestName");
    if (response.statusCode == 499) print("token mismatch into $requestName");
    if (response.statusCode == 401) print("Data not Found into $requestName");
    if (response.statusCode == 522) print("Invalid Email Address into $requestName");
    if (response.statusCode == 477) print("Invalid Phone into $requestName");
    print("The << Body >> into $requestName -> ${response.body}");
  }

  // Failure getFailureStatus(int statusCode) {
  //   if (statusCode == 330) {
  //     return DataDuplicatesFailure();
  //   } else if (statusCode == 400) {
  //     return MissingParamFailure();
  //   } else if (statusCode == 460 || statusCode == 550) {
  //     return UserNotAllowedToAccessFailure();
  //   } else if (statusCode == 560) {
  //     return OperationFailedFailure();
  //   } else if (statusCode == 499) {
  //     return TokenMisMatchFailure();
  //   } else if (statusCode == 401) {
  //     return DataNotFoundFailure();
  //   } else if (statusCode == 522) {
  //     return InvalidEmailFailure();
  //   } else if (statusCode == 477) {
  //     return InvalidPhoneFailure();
  //   } else {
  //     return ServerFailure();
  //   }
  // }

  Exception getException({@required int statusCode}) {

    if (statusCode == 330)
      return DataDuplicatesException();
    else if (statusCode == 400)
      return MissingParamException();
    else if (statusCode == 430 )
      return NotAuthenticatedException();
    else if (statusCode == 460 || statusCode == 550)
      return UserNotAllowedToAccessException();
    else if (statusCode == 560)
      return OperationFailedException();
    else if (statusCode == 499)
      return TokenMisMatchException();
    else if (statusCode == 401)
      return DataNotFoundException();
    else if (statusCode == 522)
      return InvalidEmailException();
    else if (statusCode == 477)
      return InvalidPhoneException();
    else
      return ServerException();
  }


  Future<Either<Failure , String>> handlingRequest(
      {@required _RequestCall requestCall})async{
    try{
      final response = await requestCall();
      return Right(response);
    }on ServerException {
      print("<< ServerException >> ");
      return Left(ServerFailure());
    } on DataDuplicatesException{
      print("<< DataDuplicatesException >> ");
      return Left(DataDuplicatesFailure());
    } on MissingParamException {
      print("<< MissingParamException >> ");
      return Left(MissingParamFailure());
    } on UserNotAllowedToAccessException{
      print("<< UserNotAllowedToAccessException >> ");
      return Left(UserNotAllowedToAccessFailure());
    } on OperationFailedException{
      print("<< OperationFailedException >> ");
      return Left(OperationFailedFailure());
    } on TokenMisMatchException{
      print("<< TokenMisMatchException >> ");
      return Left(TokenMisMatchFailure());
    } on DataNotFoundException{
      print("<< DataNotFoundException >> ");
      return Left(DataNotFoundFailure());
    } on InvalidEmailException{
      print("<< InvalidEmailException >> ");
      return Left(InvalidEmailFailure());
    } on InvalidPhoneException{
      print("<< InvalidPhoneException >> ");
      return Left(InvalidPhoneFailure());
    }on NotAuthenticatedException {
      print("<< NotAuthenticatedException >> ");
      return Left(NotAuthenticatedFailure());
    } on TimeoutException {
      print("<< TimeoutException >> ");
      return Left(TimeOutFailure());
    }catch (e){
      print("<< catch >> error is $e");
      return Left(ServerFailure());
    }

  }

}