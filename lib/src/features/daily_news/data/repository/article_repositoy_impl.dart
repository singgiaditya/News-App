import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:myapp/src/core/constant/constant.dart';
import 'package:myapp/src/core/resources/data_state.dart';
import 'package:myapp/src/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:myapp/src/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:myapp/src/features/daily_news/data/models/article.dart';
import 'package:myapp/src/features/daily_news/domain/entities/article.dart';
import 'package:myapp/src/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoyImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;

  ArticleRepositoyImpl(this._newsApiService, this._appDatabase);

  @override
  Future<DataState> getNewsArticle() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticle(
        apiKey: apiKey,
        country: country,
        category: category,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<void> deleteArticle(ArticleEntity article) {
    return _appDatabase.articleDao.deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<List<ArticleModel>> getSavedArticle() {
    return _appDatabase.articleDao.getArticles();
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appDatabase.articleDao.insertArticle(ArticleModel.fromEntity(article));
  }
}
