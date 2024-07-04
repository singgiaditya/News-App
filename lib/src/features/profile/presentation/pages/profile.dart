import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:myapp/src/features/authentication/presentation/bloc/authentication_event.dart';
import 'package:myapp/src/features/authentication/presentation/bloc/authentication_state.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              CircleAvatar(
                radius: 40,
                backgroundImage: CachedNetworkImageProvider(
                    "https://static.vecteezy.com/system/resources/thumbnails/001/840/618/small/picture-profile-icon-male-icon-human-or-people-sign-and-symbol-free-vector.jpg"),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                "M.Singgi Aditya Ramadhan",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 14,
              ),
              Text("msinggiadityaramadhan@gmail.com",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (_, state) {
                  return ElevatedButton(
                      onPressed: () {
                        _.read<AuthenticationBloc>().add(LogOutEvent());
                      },
                      child: Text("Logout"));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
