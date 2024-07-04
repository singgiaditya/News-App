abstract class LandingPageEvent {}

class LandingPageTabChange extends LandingPageEvent {
  final int tabIndex;
  LandingPageTabChange({required this.tabIndex});
}
