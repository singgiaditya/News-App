import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:myapp/src/features/authentication/presentation/bloc/authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthInitialState()) {
    on<LogInEvent>(onLogin);
    on<LogOutEvent>(onLogout);
  }
  
  void onLogin(LogInEvent event, Emitter<AuthenticationState> emit){
    if (event.email == "msinggiadityaramadhan@gmail.com" && event.password == "1234") {
      emit(LoggedIn());
      print("login");
    } 
  }

  void onLogout(LogOutEvent event, Emitter<AuthenticationState> emit){
    emit(LoggedOut());
  }





}