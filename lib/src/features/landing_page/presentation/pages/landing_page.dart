import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/features/landing_page/presentation/bloc/landing_page_bloc.dart';
import 'package:myapp/src/features/landing_page/presentation/bloc/landing_page_event.dart';
import 'package:myapp/src/features/landing_page/presentation/bloc/landing_page_state.dart';

class LandingPage extends StatelessWidget {
  final Widget child;
  const LandingPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LandingPageBloc, LandingPageState>(
      builder: (_, state) {
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index) => _.read<LandingPageBloc>().add(
                    LandingPageTabChange(tabIndex: index),
                  ),
              currentIndex: state.tabIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bookmark), label: "Saved"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile"),
              ]),
        );
      },
    );
  }
}
