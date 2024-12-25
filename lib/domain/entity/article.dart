import 'package:json_annotation/json_annotation.dart';
part 'article.g.dart';

@JsonSerializable()
class Article {
  Article({
    required this.uuid, //уникальный идентификатор
    required this.title, //заголовок
    required this.description, //описание заголовка
    required this.imageUrl, // картинка
  });
  final String uuid;
  final String title;
  final String description;
  final String imageUrl;

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
