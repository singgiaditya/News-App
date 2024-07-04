import 'package:bloc/bloc.dart';
import 'package:myapp/src/core/resources/data_state.dart';
import 'package:myapp/src/features/daily_news/domain/usecases/get_article.dart';
import 'package:myapp/src/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:myapp/src/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase) : super(RemoteArticleLoading()) {
    on<GetArticle>(onGetArticles);
  }

  void onGetArticles(GetArticle event, Emitter<RemoteArticleState> emit) async {
    final DataState = await _getArticleUseCase();

    if (DataState is DataSuccess && DataState.data!.isNotEmpty) {
      emit(RemoteArticleDone(DataState.data!));
    } 
    
    if (DataState is DataFailed) {
      emit(RemoteArticleError(DataState.error!));
    }
  }
}