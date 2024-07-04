import 'package:equatable/equatable.dart';

abstract class LandingPageState extends Equatable{
  final int tabIndex;

  LandingPageState({required this.tabIndex});

  @override
  List<Object?> get props => [tabIndex];

}

class LandingPageInitial extends LandingPageState{
  LandingPageInitial({required super.tabIndex});
}


