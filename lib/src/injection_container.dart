import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:myapp/src/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:myapp/src/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:myapp/src/features/daily_news/data/repository/article_repositoy_impl.dart';
import 'package:myapp/src/features/daily_news/domain/repository/article_repository.dart';
import 'package:myapp/src/features/daily_news/domain/usecases/get_article.dart';
import 'package:myapp/src/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:myapp/src/features/daily_news/domain/usecases/remove_article.dart';
import 'package:myapp/src/features/daily_news/domain/usecases/save_article.dart';
import 'package:myapp/src/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:myapp/src/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:myapp/src/features/landing_page/presentation/bloc/landing_page_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  final database = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
  sl.registerSingleton<AppDatabase>(database);
  
  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoyImpl(sl(), sl()));

  //usecases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));
  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));
  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));

  //blocs
  sl.registerFactory<RemoteArticleBloc>(
    () => RemoteArticleBloc(sl())
  );
  sl.registerFactory<LocalArticleBloc>(
    () => LocalArticleBloc(sl(),sl(),sl())
  );
  sl.registerFactory<LandingPageBloc>(
    () => LandingPageBloc()
  );
  sl.registerFactory<AuthenticationBloc>(
    () => AuthenticationBloc()
  );
}
