import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/config/routes/routes.dart';
import 'package:myapp/src/features/landing_page/presentation/bloc/landing_page_event.dart';
import 'package:myapp/src/features/landing_page/presentation/bloc/landing_page_state.dart';

class LandingPageBloc extends Bloc<LandingPageEvent, LandingPageState> {
  final List pages = ["Home", "SavedArticles", "Profile"];

  LandingPageBloc() : super(LandingPageInitial(tabIndex: 0)) {
    on<LandingPageTabChange>(onTabChange);
  }

  void onTabChange(LandingPageTabChange event, Emitter<LandingPageState> emit){
    print("index: ${event.tabIndex}");
      emit(LandingPageInitial(tabIndex: event.tabIndex));
      AppRoutes.router.goNamed(pages[event.tabIndex]);
  }
}