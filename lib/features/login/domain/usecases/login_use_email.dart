import 'package:flutter/cupertino.dart';
import 'package:test_tdd/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:test_tdd/core/use_case/use_case.dart';
import 'package:test_tdd/features/login/domain/entities/login.dart';
import 'package:test_tdd/features/login/domain/repositories/login_repository.dart';
import 'package:equatable/equatable.dart';

class LoginUseEmail implements UseCase<Login, LoginParams> {
  LoginRepository loginRepository;
  LoginUseEmail({@required this.loginRepository});
  @override
  Future<Either<Failure, Login>> call(params) async {
    return await loginRepository.loginUseEmail(
        email: params.email, password: params.password);
  }
}

class LoginParams extends Equatable {
  final String email;

  final String password;

  LoginParams({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}
