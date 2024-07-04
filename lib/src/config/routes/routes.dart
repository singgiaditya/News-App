import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:myapp/src/features/authentication/presentation/bloc/authentication_state.dart';
import 'package:myapp/src/features/authentication/presentation/pages/login.dart';
import 'package:myapp/src/features/landing_page/presentation/pages/landing_page.dart';
import 'package:myapp/src/features/profile/presentation/pages/profile.dart';
import '../../features/daily_news/domain/entities/article.dart';
import '../../features/daily_news/presentation/pages/article_detail/article_detail.dart';
import '../../features/daily_news/presentation/pages/home/daily_news.dart';
import '../../features/daily_news/presentation/pages/saved_article/saved_article.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static GoRouter router = GoRouter(
      initialLocation: "/Home",
      navigatorKey: _rootNavigatorKey,
      routes: [
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) {
              return LandingPage(child: child);
            },
            routes: [
              GoRoute(
                  parentNavigatorKey: _shellNavigatorKey,
                  path: "/Home",
                  builder: (context, state) => const DailyNews(),
                  name: "Home"),
              GoRoute(
                  parentNavigatorKey: _shellNavigatorKey,
                  path: "/SavedArticles",
                  builder: (context, state) => const SavedArticles(),
                  name: "SavedArticles"),
              GoRoute(
                  parentNavigatorKey: _shellNavigatorKey,
                  path: "/Profile",
                  builder: (context, state) => const Profile(),
                  name: "Profile"),
            ]),
        GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: "/ArticleDetails",
            builder: (context, state) =>
                ArticleDetailsView(article: state.extra as ArticleEntity),
            name: "ArticleDetails"),
        GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: "/Login",
            builder: (context, state) => const Login(),
            name: "Login"),
      ],
      redirect: _guard,
      );

  static String? _guard(BuildContext context, GoRouterState state) {
    final bool loggingIn = state.matchedLocation == '/login';
    if (context.read<AuthenticationBloc>().state is! LoggedIn) {
      return '/login';
    }
    if (loggingIn) {
      return '/Home';
    }
    return null;
  }
}
