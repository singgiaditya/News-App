import 'package:myapp/src/core/resources/data_state.dart';
import 'package:myapp/src/core/usecases/usecase.dart';
import 'package:myapp/src/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase implements Usecase<DataState, void>{
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState> call({void params}) {
    return _articleRepository.getNewsArticle();
  }

}