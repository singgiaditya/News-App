import 'package:bloc/bloc.dart';
import 'package:myapp/src/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:myapp/src/features/daily_news/domain/usecases/remove_article.dart';
import 'package:myapp/src/features/daily_news/domain/usecases/save_article.dart';
import 'package:myapp/src/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:myapp/src/features/daily_news/presentation/bloc/article/local/local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(this._getSavedArticleUseCase, this._saveArticleUseCase,
      this._removeArticleUseCase)
      : super(const LocalArticleLoading()){
        on <GetSavedArticle>(onGetSavedArticle);
        on<SaveArticle>(onSaveArticle);
        on<RemoveArticle>(onRemoveArticle);
      }

  void onGetSavedArticle(GetSavedArticle event,Emitter<LocalArticleState> emit)async{
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticleDone(articles));
  }

  void onSaveArticle(SaveArticle saveArticle,Emitter<LocalArticleState> emit)async{
    await _saveArticleUseCase(params: saveArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticleDone(articles));
  }

  void onRemoveArticle(RemoveArticle removeArticle,Emitter<LocalArticleState> emit)async{
    await _removeArticleUseCase(params: removeArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticleDone(articles));
  }
}
