import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/config/routes/routes.dart';
import 'package:myapp/src/config/theme/app_themes.dart';
import 'package:myapp/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:myapp/src/features/authentication/presentation/bloc/authentication_state.dart';
import 'package:myapp/src/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:myapp/src/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:myapp/src/features/landing_page/presentation/bloc/landing_page_bloc.dart';
import 'package:myapp/src/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<RemoteArticleBloc>(
          create: (context) => sl()..add(GetArticle()),
        ),
        BlocProvider<LandingPageBloc>(
          create: (context) => sl(),
        ),
      ],
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          AppRoutes.router.refresh();
        },
        child: MaterialApp.router(
          title: 'ToDo App',
          theme: theme(),
          routerConfig: AppRoutes.router,
        ),
      ),
    );
  }
}
