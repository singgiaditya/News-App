import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:myapp/src/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:myapp/src/features/authentication/presentation/bloc/authentication_state.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (_, state) {
        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    "Email:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  TextField(
                    decoration: InputDecoration(prefixIcon: Icon(Icons.person)),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    "Password:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  TextField(
                    decoration: InputDecoration(prefixIcon: Icon(Icons.lock)),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: (){
                            _.read<AuthenticationBloc>().add(
                            LogInEvent(email: "msinggiadityaramadhan@gmail.com", password: "1234"),
                          );
                          }, child: Text("Login")))
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
