import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthenticationState {}
class LoggedIn extends AuthenticationState {}
class LoggedOut extends AuthenticationState {}
