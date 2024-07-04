import 'package:myapp/src/core/constant/constant.dart';
import 'package:myapp/src/features/daily_news/data/models/article.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part "news_api_service.g.dart";

@RestApi(baseUrl: baseUrl)
abstract class NewsApiService{
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET(listNewsApi)
  Future<HttpResponse<List<ArticleModel>>> getNewsArticle({
    @Query("apiKey") String ? apiKey,
    @Query("country") String ? country,
    @Query("category") String ? category,
  });
}