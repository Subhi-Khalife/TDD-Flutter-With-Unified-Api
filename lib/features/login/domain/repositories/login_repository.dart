import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_tdd/core/error/failures.dart';
import 'package:test_tdd/features/login/domain/entities/login.dart';

abstract class LoginRepository {
  Future<List<Login>> getAllPosts();
  Future<Either<Failure,Login>> loginUseEmail({@required String  email ,@required String password});
}
