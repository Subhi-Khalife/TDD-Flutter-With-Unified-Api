part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class Loading extends LoginState {}

class Sucess extends LoginState {
  final Login login ;

  Sucess({@required this.login});
}

class Failed extends LoginState {
  final String error ;

  Failed({@required this.error});
}

