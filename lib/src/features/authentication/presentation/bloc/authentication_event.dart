import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class LogInEvent extends AuthenticationEvent {
  final String email;
  final String password;

  LogInEvent({required this.email, required this.password}): super();

}

class LogOutEvent extends AuthenticationEvent {}