part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class FetchLoginByPhone extends LoginEvent {
final String phone;
final String password;
UseCase  useCase;
FetchLoginByPhone({this.phone , this.password,this.useCase});
  @override
  List<Object> get props => [];

}


class InitalEvent extends LoginEvent {
    @override
  List<Object> get props => [];
}
