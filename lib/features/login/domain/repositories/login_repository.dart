import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_tdd/core/error/failures.dart';
import 'package:test_tdd/features/login/domain/entities/user.dart';

abstract class LoginRepository {
  Future<Either<Failure,User>> loginUseEmail({@required Map<String , dynamic> param});
}
