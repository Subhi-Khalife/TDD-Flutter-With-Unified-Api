import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_tdd/core/error/failures.dart';
import 'package:test_tdd/core/use_case/use_case.dart';
import 'package:test_tdd/features/login/data/repositories/login_repository_impl.dart';
import 'package:test_tdd/features/login/domain/entities/user.dart';
import 'package:test_tdd/features/login/domain/repositories/login_repository.dart';
import 'package:test_tdd/features/login/domain/usecases/login_use_email.dart';

import '../../../../../core/error/failures.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc() : super(LoginInitial());

  // LoginUseEmail loginUseEmail;

  final UseCase  loginUseCase = LoginUseEmail(
                          loginRepository: LoginRepositoryImpl());
  

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {

    if(event is InitalEvent)
      yield Loading();
  if(event is FetchLoginByPhone )
    {
      print("Layer 1 : Presentation  Bloc => called event FetchLoginByPhone <=");

      yield Loading();
          final failureOrLogin =
              await loginUseCase(LoginParams(
                email: event.phone,
                password: event.password
              ));
          yield* _eitherLoadedOrErrorState(failureOrLogin);
   }
  }
}



Stream<LoginState> _eitherLoadedOrErrorState(
    Either<Failure, User> failureOrTrivia,
  ) async* {
    yield failureOrTrivia.fold(
      (failure){
        print("Layer 1 : Presentation  Bloc => get failure from use case and return Failed state <=");

        if(failure is MissingParamFailure)
          print("MissingParamFailure");

       return Failed(error: "Error Test ...");
      },
      (loginObj) {
        print("Layer 1 : Presentation  Bloc => get data from use case and return Success state <=");

        return Success(login: loginObj);
      },
    );
  }