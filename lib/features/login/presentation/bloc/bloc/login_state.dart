part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class Loading extends LoginState {}

class Success extends LoginState {
  final User login ;

  Success({@required this.login});
}

class Failed extends LoginState {
  final String error ;

  Failed({@required this.error});
}

