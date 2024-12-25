
import 'package:dio/dio.dart';
import 'package:flop/domain/entity/article.dart';

class ApiClient {
  static const url = 'http://127.0.0.1:5000';
  final Dio dio = Dio();

  Future<List<Article>> getAllFacts() async {
    try {
      //отправляем запрос
      final res = await dio.get(url + '/getAllFacts');
      //генерируем факты из json сериализации
      final facts = (res.data as List).map((item) => Article.fromJson(item)).toList();
      return facts;
    }
    on DioException catch (err) {
      throw err.message.toString();
    }
  }
}