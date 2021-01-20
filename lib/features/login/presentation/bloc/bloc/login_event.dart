part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class FetchLoginByPhone extends LoginEvent {
final String phone;
final String password;

FetchLoginByPhone({this.phone , this.password});
  @override
  List<Object> get props => [];

}


class InitalEvent extends LoginEvent {
    @override
  List<Object> get props => [];
}
