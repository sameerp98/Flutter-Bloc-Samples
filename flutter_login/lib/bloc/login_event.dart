part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

  const LoginButtonPressed({this.username, this.password});

  @override
  List<Object> get props => [username, password];

  @override
  String toString() {
    return 'LoginButtonPressed { username : $username, password: $password }';
  }
}
