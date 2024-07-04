import 'package:floor/floor.dart';
import 'package:myapp/src/features/daily_news/domain/entities/article.dart';

@Entity(tableName: "Article", primaryKeys: ['id'])
class ArticleModel extends ArticleEntity{
  final int ? id;
  final String ? author;
  final String ? title;
  final String ? description;
  final String ? url;
  final String ? urlToImage;
  final String ? publishedAt;
  final String ? content;

 const ArticleModel({
  this.id,
  this.author,
  this.title,
  this.description,
  this.url,
  this.urlToImage,
  this.publishedAt,
  this.content,
 });

 factory ArticleModel.fromJson(Map<String, dynamic> data){
  return ArticleModel(
    author: data['author'] ?? "",
    title: data['title'] ?? "",
    description: data['description'] ?? "",
    url: data['url'] ?? "",
    urlToImage: data['urlToImage'] ?? "",
    publishedAt: data['publishedAt'] ?? "",
    content: data['content'] ?? "",
  );
 }
 factory ArticleModel.fromEntity(ArticleEntity entity){
  return ArticleModel(
    id: entity.id,
    author: entity.author,
    description: entity.description,
    url: entity.url,
    urlToImage: entity.urlToImage,
    publishedAt: entity.publishedAt,
    content: entity.content,
  );
 }
}