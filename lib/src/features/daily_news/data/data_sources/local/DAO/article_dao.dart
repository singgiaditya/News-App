import 'package:floor/floor.dart';
import 'package:myapp/src/features/daily_news/data/models/article.dart';

@dao
abstract class ArticleDao{
  @insert
  Future<void> insertArticle(ArticleModel article);

  @delete
  Future<void> deleteArticle(ArticleModel article);

  @Query('SELECT * FROM Article')
  Future<List<ArticleModel>> getArticles();

}