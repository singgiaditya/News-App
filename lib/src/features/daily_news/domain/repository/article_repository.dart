import 'package:myapp/src/core/resources/data_state.dart';
import 'package:myapp/src/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository{
  //api methods
  Future<DataState> getNewsArticle();

  //database methods
  Future<List<ArticleEntity>> getSavedArticle();
  Future<void> saveArticle(ArticleEntity article);
  Future<void> deleteArticle(ArticleEntity article);
}